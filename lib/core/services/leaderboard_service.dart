// services/leaderboard_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiplayer_tic_tac_toe_app/models/game_model.dart';
import 'package:multiplayer_tic_tac_toe_app/models/score_model.dart';
import 'package:multiplayer_tic_tac_toe_app/models/user_model.dart';

final leaderboardServiceProvider = Provider<LeaderboardService>((ref) {
  return LeaderboardService();
});

final globalLeaderboardProvider = StreamProvider<List<ScoreModel>>((ref) {
  return ref.read(leaderboardServiceProvider).getGlobalLeaderboard();
});

final weeklyLeaderboardProvider = StreamProvider<List<ScoreModel>>((ref) {
  return ref.read(leaderboardServiceProvider).getWeeklyLeaderboard();
});

final monthlyLeaderboardProvider = StreamProvider<List<ScoreModel>>((ref) {
  return ref.read(leaderboardServiceProvider).getMonthlyLeaderboard();
});

class LeaderboardService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Global leaderboard (all time)
  Stream<List<ScoreModel>> getGlobalLeaderboard({int limit = 100}) {
    return _firestore
        .collection('users')
        .orderBy('wins', descending: true)
        .limit(limit)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => UserModel.fromJson(doc.data()))
              .map((user) => _calculateScore(user))
              .where((score) => score.totalGames > 0)
              .toList()
            ..sort((a, b) {
              // Sort by win rate, then by total wins
              final winRateComparison = b.winRate.compareTo(a.winRate);
              if (winRateComparison != 0) return winRateComparison;
              return b.wins.compareTo(a.wins);
            });
        });
  }

  // Weekly leaderboard
  Stream<List<ScoreModel>> getWeeklyLeaderboard({int limit = 50}) {
    final weekAgo = DateTime.now().subtract(const Duration(days: 7));

    return _getLeaderboardForPeriod(weekAgo, limit);
  }

  // Monthly leaderboard
  Stream<List<ScoreModel>> getMonthlyLeaderboard({int limit = 50}) {
    final monthAgo = DateTime.now().subtract(const Duration(days: 30));

    return _getLeaderboardForPeriod(monthAgo, limit);
  }

  // Get leaderboard for a specific time period
  Stream<List<ScoreModel>> _getLeaderboardForPeriod(DateTime since, int limit) {
    return _firestore
        .collection('games')
        .where('status', isEqualTo: GameStatus.completed.name)
        .where('completedAt', isGreaterThan: since) // <-- FIX: use DateTime
        .snapshots()
        .map((snapshot) {
          final Map<String, Map<String, int>> playerStats = {};
          final Map<String, String> playerNames = {};

          for (final doc in snapshot.docs) {
            final game = GameModel.fromJson(doc.data());

            // Init stats
            playerStats[game.player1Id] ??= {
              'wins': 0,
              'losses': 0,
              'draws': 0,
            };
            if (game.player2Id != null) {
              playerStats[game.player2Id!] ??= {
                'wins': 0,
                'losses': 0,
                'draws': 0,
              };
            }

            // Store names
            playerNames[game.player1Id] = game.player1Name;
            if (game.player2Id != null && game.player2Name != null) {
              playerNames[game.player2Id!] = game.player2Name!;
            }

            // Update stats
            if (game.winnerId != null) {
              playerStats[game.winnerId]!['wins'] =
                  (playerStats[game.winnerId]!['wins'] ?? 0) + 1;

              final loserId = game.winnerId == game.player1Id
                  ? game.player2Id
                  : game.player1Id;
              if (loserId != null) {
                playerStats[loserId]!['losses'] =
                    (playerStats[loserId]!['losses'] ?? 0) + 1;
              }
            } else {
              playerStats[game.player1Id]!['draws'] =
                  (playerStats[game.player1Id]!['draws'] ?? 0) + 1;
              if (game.player2Id != null) {
                playerStats[game.player2Id!]!['draws'] =
                    (playerStats[game.player2Id!]!['draws'] ?? 0) + 1;
              }
            }
          }

          return playerStats.entries
              .map((entry) {
                final stats = entry.value;
                final totalGames =
                    stats['wins']! + stats['losses']! + stats['draws']!;
                final winRate = totalGames > 0
                    ? stats['wins']! / totalGames
                    : 0.0;

                return ScoreModel(
                  userId: entry.key,
                  displayName: playerNames[entry.key] ?? 'Unknown Player',
                  wins: stats['wins']!,
                  losses: stats['losses']!,
                  draws: stats['draws']!,
                  totalGames: totalGames,
                  winRate: winRate,
                );
              })
              .where((score) => score.totalGames > 0)
              .toList()
            ..sort((a, b) {
              final winRateComparison = b.winRate.compareTo(a.winRate);
              if (winRateComparison != 0) return winRateComparison;
              return b.wins.compareTo(a.wins);
            })
            ..take(limit).toList();
        });
  }

  // Calculate score model from user data
  ScoreModel _calculateScore(UserModel user) {
    final totalGames = user.wins + user.losses + user.draws;
    final winRate = totalGames > 0 ? user.wins / totalGames : 0.0;

    return ScoreModel(
      userId: user.id,
      displayName: user.displayName,
      wins: user.wins,
      losses: user.losses,
      draws: user.draws,
      totalGames: totalGames,
      winRate: winRate,
    );
  }

  // Get user's rank in global leaderboard
  Future<int?> getUserRank(String userId) async {
    final snapshot = await _firestore
        .collection('users')
        .orderBy('wins', descending: true)
        .get();

    final scores =
        snapshot.docs
            .map((doc) => UserModel.fromJson(doc.data()))
            .map((user) => _calculateScore(user))
            .where((score) => score.totalGames > 0)
            .toList()
          ..sort((a, b) {
            final winRateComparison = b.winRate.compareTo(a.winRate);
            if (winRateComparison != 0) return winRateComparison;
            return b.wins.compareTo(a.wins);
          });

    final userIndex = scores.indexWhere((score) => score.userId == userId);
    return userIndex >= 0 ? userIndex + 1 : null;
  }
}
