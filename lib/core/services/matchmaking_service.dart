// services/matchmaking_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiplayer_tic_tac_toe_app/models/game_model.dart';
import 'game_service.dart';

final matchmakingServiceProvider = Provider<MatchmakingService>((ref) {
  return MatchmakingService(ref.read(gameServiceProvider));
});

final matchmakingViewModelProvider =
    StateNotifierProvider<MatchmakingViewModel, AsyncValue<String?>>((ref) {
      return MatchmakingViewModel(ref.read(matchmakingServiceProvider));
    });

class MatchmakingService {
  MatchmakingService(this._gameService);

  final GameService _gameService;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Find and join a random available game
  Future<String?> findMatch() async {
    final user = _auth.currentUser;
    if (user == null) throw 'User not authenticated';

    // Get available games
    final gamesSnapshot = await _firestore
        .collection('games')
        .where('status', isEqualTo: GameStatus.waiting.name)
        .where('player1Id', isNotEqualTo: user.uid)
        .limit(1)
        .get();

    if (gamesSnapshot.docs.isNotEmpty) {
      // Join existing game
      final gameId = gamesSnapshot.docs.first.id;
      await _gameService.joinGame(gameId);
      return gameId;
    } else {
      // Create new game
      return await _gameService.createGame();
    }
  }

  // Quick match with similar skill level players
  Future<String?> findRankedMatch() async {
    final user = _auth.currentUser;
    if (user == null) throw 'User not authenticated';

    // Get user stats
    final userDoc = await _firestore.collection('users').doc(user.uid).get();
    if (!userDoc.exists) throw 'User data not found';

    final userData = userDoc.data()!;
    final userWins = userData['wins'] ?? 0;
    final userLosses = userData['losses'] ?? 0;
    final userWinRate = userLosses > 0
        ? userWins / (userWins + userLosses)
        : 1.0;

    // Try to find a game with similar skill level (±0.2 win rate)
    final minWinRate = (userWinRate - 0.2).clamp(0.0, 1.0);
    final maxWinRate = (userWinRate + 0.2).clamp(0.0, 1.0);

    // This would require a more complex query in practice
    // For now, we'll use the basic matchmaking
    return await findMatch();
  }
}

class MatchmakingViewModel extends StateNotifier<AsyncValue<String?>> {
  MatchmakingViewModel(this._matchmakingService)
    : super(const AsyncValue.data(null));

  final MatchmakingService _matchmakingService;

  Future<String?> findMatch() async {
    state = const AsyncValue.loading();
    try {
      final gameId = await _matchmakingService.findMatch();
      state = AsyncValue.data(gameId);
      return gameId;
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
      return null;
    }
  }

  Future<String?> findRankedMatch() async {
    state = const AsyncValue.loading();
    try {
      final gameId = await _matchmakingService.findRankedMatch();
      state = AsyncValue.data(gameId);
      return gameId;
    } catch (e) {
      state = AsyncValue.error(e.toString(), StackTrace.current);
      return null;
    }
  }
}
