// services/score_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiplayer_tic_tac_toe_app/models/game_model.dart';
import 'package:multiplayer_tic_tac_toe_app/models/score_model.dart';
import 'package:multiplayer_tic_tac_toe_app/models/user_model.dart';

final scoreServiceProvider = Provider<ScoreService>((ref) {
  return ScoreService();
});

final userScoreProvider = StreamProvider<ScoreModel?>((ref) {
  return ref.read(scoreServiceProvider).getCurrentUserScore();
});

final leaderboardProvider = StreamProvider<List<ScoreModel>>((ref) {
  return ref.read(scoreServiceProvider).getLeaderboard();
});

class ScoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get current user's score
  Stream<ScoreModel?> getCurrentUserScore() {
    final user = _auth.currentUser;
    if (user == null) return Stream.value(null);

    return _firestore.collection('users').doc(user.uid).snapshots().map((doc) {
      if (!doc.exists) return null;
      final userData = UserModel.fromJson(doc.data()!);
      return _calculateScore(userData);
    });
  }

  // Get user score by ID
  Future<ScoreModel?> getUserScore(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).get();
    if (!doc.exists) return null;

    final userData = UserModel.fromJson(doc.data()!);
    return _calculateScore(userData);
  }

  // Get leaderboard
  Stream<List<ScoreModel>> getLeaderboard({int limit = 50}) {
    return _firestore
        .collection('users')
        .orderBy('wins', descending: true)
        .limit(limit)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => UserModel.fromJson(doc.data()))
              .map((user) => _calculateScore(user))
              .toList()
            ..sort((a, b) => b.winRate.compareTo(a.winRate));
        });
  }

  // Calculate score model from user data
  ScoreModel _calculateScore(UserModel user) {
    final totalGames = user.wins + user.losses + user.draws;
    final winRate = totalGames > 0 ? user.wins / totalGames : 0.0;

    return ScoreModel.create(
      userId: user.id,
      displayName: user.displayName,
      wins: user.wins,
      losses: user.losses,
      draws: user.draws,
      totalGames: totalGames,
      winRate: winRate,
    );
  }

  // Reset user stats (admin function)
  Future<void> resetUserStats(String userId) async {
    await _firestore.collection('users').doc(userId).update({
      'wins': 0,
      'losses': 0,
      'draws': 0,
    });
  }

  // Add this method to your ScoreService class
  Stream<List<GameModel>> getUserGameHistory() {
    final user = _auth.currentUser;
    if (user == null) return Stream.value([]);

    return _firestore
        .collection('games')
        .where('status', isEqualTo: GameStatus.completed.name)
        .where(
          Filter.or(
            Filter('player1Id', isEqualTo: user.uid),
            Filter('player2Id', isEqualTo: user.uid),
          ),
        )
        .orderBy('completedAt', descending: true)
        .limit(20)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            try {
              final data = Map<String, dynamic>.from(doc.data());

              // Convert flat board to 2D for GameModel
              if (data['board'] is List) {
                final flatBoard = List<String>.from(data['board']);
                if (flatBoard.length == 9) {
                  data['board'] = _boardTo2D(flatBoard);
                } else {
                  // Handle corrupted board data
                  data['board'] = List.generate(
                    3,
                    (_) => List.generate(3, (_) => ''),
                  );
                }
              } else {
                // Handle missing or invalid board data
                data['board'] = List.generate(
                  3,
                  (_) => List.generate(3, (_) => ''),
                );
              }

              return GameModel.fromJson(data);
            } catch (e) {
              // Log error and return a placeholder game or skip
              print('Error parsing game ${doc.id}: $e');
              // You could return null here and filter it out, or create a placeholder
              throw e; // Let the UI handle the error
            }
          }).toList();
        });
  }

  // Helper method to convert flat board to 2D (same as in GameService)
  List<List<String>> _boardTo2D(List<String> flatBoard) {
    return List.generate(
      3,
      (row) => List.generate(3, (col) => flatBoard[row * 3 + col]),
    );
  }

  // Add this temporary method to your ScoreService for cleanup
  Future<void> cleanupAllGames() async {
    final batch = _firestore.batch();
    final snapshot = await _firestore.collection('games').get();

    for (final doc in snapshot.docs) {
      batch.delete(doc.reference);
    }

    await batch.commit();
    print('All games deleted');
  }
}
