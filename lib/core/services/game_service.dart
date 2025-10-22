//flattened board
// services/game_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiplayer_tic_tac_toe_app/models/game_model.dart'
    as game_model;
import 'package:multiplayer_tic_tac_toe_app/models/move_model.dart'
    as move_model;
import 'package:uuid/uuid.dart';

final gameServiceProvider = Provider<GameService>((ref) {
  return GameService();
});

final activeGameProvider = StreamProvider.family<game_model.GameModel?, String>(
  (ref, gameId) {
    return ref.read(gameServiceProvider).getGameStream(gameId);
  },
);

final availableGamesProvider = StreamProvider<List<game_model.GameModel>>((
  ref,
) {
  return ref.read(gameServiceProvider).getAvailableGames();
});

class GameService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Uuid _uuid = const Uuid();

  // Helper method to convert 2D coordinates to 1D index
  int _get1DIndex(int row, int col) => row * 3 + col;

  // Helper method to convert 1D index to row
  int _getRow(int index) => index ~/ 3;

  // Helper method to convert 1D index to column
  int _getCol(int index) => index % 3;

  // Helper method to convert flat board to 2D for game logic
  List<List<String>> _boardTo2D(List<String> flatBoard) {
    return List.generate(
      3,
      (row) => List.generate(3, (col) => flatBoard[_get1DIndex(row, col)]),
    );
  }

  // Helper method to convert 2D board to flat for Firestore
  List<String> _boardToFlat(List<List<String>> board2D) {
    final flatBoard = List<String>.filled(9, '');
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        flatBoard[_get1DIndex(row, col)] = board2D[row][col];
      }
    }
    return flatBoard;
  }

  // Create a new game
  Future<String> createGame() async {
    final user = _auth.currentUser;
    if (user == null) throw 'User not authenticated';

    print('createGame called by user=${user.uid}');

    final gameId = _uuid.v4();

    // Create empty 3x3 board for GameModel (2D array)
    final emptyBoard2D = List.generate(3, (_) => List.generate(3, (_) => ''));

    final game = game_model.GameModel.create(
      id: gameId,
      player1Id: user.uid,
      player1Name: user.displayName ?? 'Player 1',
      board: emptyBoard2D, // Pass 2D board to GameModel
      currentTurn: game_model.Player.x,
      status: game_model.GameStatus.waiting,
      createdAt: DateTime.now(),
      moveCount: 0,
    );

    // Convert to flat structure for Firestore
    final gameData = game.toJson();
    gameData['board'] = _boardToFlat(emptyBoard2D);

    try {
      await _firestore.collection('games').doc(gameId).set(gameData);
      print('createGame succeeded: gameId=$gameId by user=${user.uid}');
    } catch (e, st) {
      // Log more context to help debugging when Firestore write fails
      print('createGame failed for gameId=$gameId, user=${user.uid}: $e');
      print(st);
      rethrow;
    }

    return gameId;
  }

  // // Join an existing game
  // Future<void> joinGame(String gameId) async {
  //   final user = _auth.currentUser;
  //   if (user == null) throw 'User not authenticated';

  //   final gameRef = _firestore.collection('games').doc(gameId);
  //   final gameDoc = await gameRef.get();

  //   if (!gameDoc.exists) throw 'Game not found';

  //   // Get flat board from Firestore and convert to 2D for GameModel
  //   final gameData = gameDoc.data()!;
  //   final flatBoard = List<String>.from(gameData['board']);
  //   gameData['board'] = _boardTo2D(flatBoard);

  //   final game = game_model.GameModel.fromJson(gameData);

  //   if (game.player2Id != null) throw 'Game is already full';
  //   if (game.player1Id == user.uid) throw 'Cannot join your own game';

  //   await gameRef.update({
  //     'player2Id': user.uid,
  //     'player2Name': user.displayName ?? 'Player 2',
  //     'status': game_model.GameStatus.inProgress.name,
  //   });
  // }

  //Improved joinGame method for GameService
  Future<void> joinGame(String gameId) async {
    final user = _auth.currentUser;
    if (user == null) throw 'User not authenticated';

    final gameRef = _firestore.collection('games').doc(gameId);

    // Use transaction to ensure atomic operation
    await _firestore.runTransaction((transaction) async {
      final gameDoc = await transaction.get(gameRef);

      if (!gameDoc.exists) throw 'Game not found';

      // Get flat board from Firestore and convert to 2D for GameModel
      final gameData = gameDoc.data()!;
      final flatBoard = List<String>.from(gameData['board']);
      gameData['board'] = _boardTo2D(flatBoard);

      final game = game_model.GameModel.fromJson(gameData);

      if (game.player2Id != null) throw 'Game is already full';
      if (game.player1Id == user.uid) throw 'Cannot join your own game';
      if (game.status != game_model.GameStatus.waiting) {
        throw 'Game is no longer available';
      }

      // Update game with player 2 information
      transaction.update(gameRef, {
        'player2Id': user.uid,
        'player2Name': user.displayName ?? 'Player 2',
        'status': game_model.GameStatus.inProgress.name,
        'updatedAt': DateTime.now().toIso8601String(),
      });
    });
  }

  // Make a move
  Future<void> makeMove(String gameId, int row, int col) async {
    final user = _auth.currentUser;
    if (user == null) throw 'User not authenticated';

    final gameRef = _firestore.collection('games').doc(gameId);
    final gameDoc = await gameRef.get();

    if (!gameDoc.exists) throw 'Game not found';

    // Get flat board from Firestore and convert to 2D for GameModel
    final gameData = Map<String, dynamic>.from(gameDoc.data()!);
    final flatBoard = List<String>.from(gameData['board']);
    gameData['board'] = _boardTo2D(flatBoard);

    final game = game_model.GameModel.fromJson(gameData);

    if (game.status != game_model.GameStatus.inProgress)
      throw 'Game is not in progress';

    // game.board is now 2D, use it directly
    if (game.board[row][col].isNotEmpty) throw 'Cell is already occupied';

    final isPlayer1 = game.player1Id == user.uid;
    final isPlayer2 = game.player2Id == user.uid;

    if (!isPlayer1 && !isPlayer2) throw 'You are not a player in this game';

    // Determine the current player symbol based on whose turn it is
    String playerSymbol;
    if (game.currentTurn == game_model.Player.x) {
      playerSymbol = 'X';
    } else {
      playerSymbol = 'O';
    }

    // Check if it's actually this player's turn
    final shouldBePlayerXTurn = game.currentTurn == game_model.Player.x;
    if ((isPlayer1 && !shouldBePlayerXTurn) ||
        (isPlayer2 && shouldBePlayerXTurn)) {
      throw 'Not your turn';
    }

    // Update 2D board
    final newBoard = List<List<String>>.from(
      game.board.map((row) => List<String>.from(row)),
    );
    newBoard[row][col] = playerSymbol;

    // Check for winner
    final winner = _checkWinner(newBoard);
    final isDraw = _checkDraw(newBoard);

    game_model.GameStatus newStatus = game.status;
    String? winnerId;

    if (winner != null) {
      newStatus = game_model.GameStatus.completed;
      winnerId = winner == 'X' ? game.player1Id : game.player2Id;
    } else if (isDraw) {
      newStatus = game_model.GameStatus.completed;
    }

    // Convert 2D board to flat for Firestore storage
    final newFlatBoard = _boardToFlat(newBoard);

    // Switch turns: X -> O, O -> X
    final nextTurn = game.currentTurn == game_model.Player.x
        ? game_model.Player.o
        : game_model.Player.x;

    // Update game with flat board
    await gameRef.update({
      'board': newFlatBoard, // Store as flat array
      'currentTurn': nextTurn.name,
      'moveCount': game.moveCount + 1,
      'status': newStatus.name,
      if (winnerId != null) 'winnerId': winnerId,
      if (newStatus == game_model.GameStatus.completed)
        'completedAt': DateTime.now().toIso8601String(),
    });

    // Record move
    final move = move_model.MoveModel.create(
      gameId: gameId,
      playerId: user.uid,
      row: row,
      col: col,
      player: game.currentTurn == game_model.Player.x
          ? game_model.Player.x
          : game_model.Player.o,
      timestamp: DateTime.now(),
    );

    await _firestore.collection('moves').add(move.toJson());

    // Update scores if game is completed
    if (newStatus == game_model.GameStatus.completed) {
      await _updatePlayerScores(game, winnerId);
    }
  }

  // Check for winner
  String? _checkWinner(List<List<String>> board) {
    // Check rows
    for (int i = 0; i < 3; i++) {
      if (board[i][0].isNotEmpty &&
          board[i][0] == board[i][1] &&
          board[i][1] == board[i][2]) {
        return board[i][0];
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (board[0][i].isNotEmpty &&
          board[0][i] == board[1][i] &&
          board[1][i] == board[2][i]) {
        return board[0][i];
      }
    }

    // Check diagonals
    if (board[0][0].isNotEmpty &&
        board[0][0] == board[1][1] &&
        board[1][1] == board[2][2]) {
      return board[0][0];
    }

    if (board[0][2].isNotEmpty &&
        board[0][2] == board[1][1] &&
        board[1][1] == board[2][0]) {
      return board[0][2];
    }

    return null;
  }

  // Check for draw
  bool _checkDraw(List<List<String>> board) {
    return board.every((row) => row.every((cell) => cell.isNotEmpty));
  }

  // Update player scores
  Future<void> _updatePlayerScores(
    game_model.GameModel game,
    String? winnerId,
  ) async {
    final batch = _firestore.batch();

    if (winnerId != null) {
      // Winner gets a win
      final winnerRef = _firestore.collection('users').doc(winnerId);
      batch.update(winnerRef, {'wins': FieldValue.increment(1)});

      // Loser gets a loss
      final loserId = winnerId == game.player1Id
          ? game.player2Id
          : game.player1Id;
      if (loserId != null) {
        final loserRef = _firestore.collection('users').doc(loserId);
        batch.update(loserRef, {'losses': FieldValue.increment(1)});
      }
    } else {
      // Draw - both players get a draw
      final player1Ref = _firestore.collection('users').doc(game.player1Id);
      batch.update(player1Ref, {'draws': FieldValue.increment(1)});

      if (game.player2Id != null) {
        final player2Ref = _firestore.collection('users').doc(game.player2Id!);
        batch.update(player2Ref, {'draws': FieldValue.increment(1)});
      }
    }

    await batch.commit();
  }

  // Get game stream
  Stream<game_model.GameModel?> getGameStream(String gameId) {
    return _firestore.collection('games').doc(gameId).snapshots().map((doc) {
      if (!doc.exists) return null;

      // Convert flat board to 2D for GameModel
      final data = doc.data()!;
      final flatBoard = List<String>.from(data['board']);
      data['board'] = _boardTo2D(flatBoard);

      return game_model.GameModel.fromJson(data);
    });
  }

  // Get available games to join
  Stream<List<game_model.GameModel>> getAvailableGames() {
    return _firestore
        .collection('games')
        .where('status', isEqualTo: game_model.GameStatus.waiting.name)
        .orderBy('createdAt', descending: true)
        .limit(10)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) {
                // Convert flat board to 2D for GameModel
                final data = doc.data();
                final flatBoard = List<String>.from(data['board']);

                //Convert flat array into 2D array
                data['board'] = _boardTo2D(flatBoard);

                try {
                  return game_model.GameModel.fromJson(data);
                } catch (e, st) {
                  print('Failed to deserialize available game ${doc.id}: $e');
                  print(st);
                  return null;
                }
              })
              .whereType<game_model.GameModel>()
              .toList();
        });
  }

  // Leave/Abandon game
  Future<void> abandonGame(String gameId) async {
    final user = _auth.currentUser;
    if (user == null) throw 'User not authenticated';

    await _firestore.collection('games').doc(gameId).update({
      'status': game_model.GameStatus.abandoned.name,
      'completedAt': DateTime.now().toIso8601String(),
    });
  }

  // Helper method to clean up corrupted games (call this once if needed)
  Future<void> cleanupCorruptedGames() async {
    try {
      final snapshot = await _firestore.collection('games').get();
      final batch = _firestore.batch();

      for (final doc in snapshot.docs) {
        final data = doc.data();
        final boardData = data['board'];

        // Check if board data is corrupted
        if (boardData is! List || boardData.length != 9) {
          // Delete corrupted game
          batch.delete(doc.reference);
        }
      }

      await batch.commit();
      print('Cleaned up corrupted games');
    } catch (e) {
      print('Error cleaning up games: $e');
    }
  }
}
