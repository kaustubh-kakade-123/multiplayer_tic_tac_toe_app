// // services/game_service.dart
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:multiplayer_tic_tac_toe_app/models/game_model.dart'
//     as game_model;
// import 'package:multiplayer_tic_tac_toe_app/models/move_model.dart'
//     as move_model;
// import 'package:uuid/uuid.dart';

// final gameServiceProvider = Provider<GameService>((ref) {
//   return GameService();
// });

// final activeGameProvider = StreamProvider.family<game_model.GameModel?, String>(
//   (ref, gameId) {
//     return ref.read(gameServiceProvider).getGameStream(gameId);
//   },
// );

// final availableGamesProvider = StreamProvider<List<game_model.GameModel>>((
//   ref,
// ) {
//   return ref.read(gameServiceProvider).getAvailableGames();
// });

// class GameService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final Uuid _uuid = const Uuid();

//   // Create a new game
//   Future<String> createGame() async {
//     final user = _auth.currentUser;
//     if (user == null) throw 'User not authenticated';

//     final gameId = _uuid.v4();
//     final game = game_model.GameModel(
//       id: gameId,
//       player1Id: user.uid,
//       player1Name: user.displayName ?? 'Player 1',
//       board: List.generate(3, (_) => List.generate(3, (_) => '')),
//       currentTurn: game_model.Player.x,
//       status: game_model.GameStatus.waiting,
//       createdAt: DateTime.now(),
//       moveCount: 0,
//     );

//     await _firestore.collection('games').doc(gameId).set(game.toJson());

//     return gameId;
//   }

//   // Join an existing game
//   Future<void> joinGame(String gameId) async {
//     final user = _auth.currentUser;
//     if (user == null) throw 'User not authenticated';

//     final gameRef = _firestore.collection('games').doc(gameId);
//     final gameDoc = await gameRef.get();

//     if (!gameDoc.exists) throw 'Game not found';

//     final game = game_model.GameModel.fromJson(gameDoc.data()!);

//     if (game.player2Id != null) throw 'Game is already full';
//     if (game.player1Id == user.uid) throw 'Cannot join your own game';

//     await gameRef.update({
//       'player2Id': user.uid,
//       'player2Name': user.displayName ?? 'Player 2',
//       'status': game_model.GameStatus.inProgress.name,
//     });
//   }

//   // Make a move
//   Future<void> makeMove(String gameId, int row, int col) async {
//     final user = _auth.currentUser;
//     if (user == null) throw 'User not authenticated';

//     final gameRef = _firestore.collection('games').doc(gameId);
//     final gameDoc = await gameRef.get();

//     if (!gameDoc.exists) throw 'Game not found';

//     final game = game_model.GameModel.fromJson(gameDoc.data()!);

//     if (game.status != game_model.GameStatus.inProgress)
//       throw 'Game is not in progress';
//     if (game.board[row][col].isNotEmpty) throw 'Cell is already occupied';

//     final isPlayer1 = game.player1Id == user.uid;
//     final isPlayer2 = game.player2Id == user.uid;

//     if (!isPlayer1 && !isPlayer2) throw 'You are not a player in this game';

//     final currentPlayerSymbol = isPlayer1
//         ? game_model.Player.x
//         : game_model.Player.o;
//     if (game.currentTurn != currentPlayerSymbol) throw 'Not your turn';

//     // Update board
//     final newBoard = List<List<String>>.from(
//       game.board.map((row) => List<String>.from(row)),
//     );
//     newBoard[row][col] = currentPlayerSymbol == move_model.Player.x ? 'X' : 'O';

//     // Check for winner
//     final winner = _checkWinner(newBoard);
//     final isDraw = _checkDraw(newBoard);

//     game_model.GameStatus newStatus = game.status;
//     String? winnerId;

//     if (winner != null) {
//       newStatus = game_model.GameStatus.completed;
//       winnerId = winner == 'X' ? game.player1Id : game.player2Id;
//     } else if (isDraw) {
//       newStatus = game_model.GameStatus.completed;
//     }

//     // Update game
//     await gameRef.update({
//       'board': newBoard,
//       'currentTurn': currentPlayerSymbol == game_model.Player.x
//           ? game_model.Player.o.name
//           : game_model.Player.x.name,
//       'moveCount': game.moveCount + 1,
//       'status': newStatus.name,
//       if (winnerId != null) 'winnerId': winnerId,
//       if (newStatus == game_model.GameStatus.completed)
//         'completedAt': DateTime.now().toIso8601String(),
//     });

//     // Record move
//     final move = move_model.MoveModel(
//       gameId: gameId,
//       playerId: user.uid,
//       row: row,
//       col: col,
//       player: currentPlayerSymbol == game_model.Player.x
//           ? move_model.Player.x
//           : move_model.Player.o,
//       timestamp: DateTime.now(),
//     );

//     await _firestore.collection('moves').add(move.toJson());

//     // Update scores if game is completed
//     if (newStatus == game_model.GameStatus.completed) {
//       await _updatePlayerScores(game, winnerId);
//     }
//   }

//   // Check for winner
//   String? _checkWinner(List<List<String>> board) {
//     // Check rows
//     for (int i = 0; i < 3; i++) {
//       if (board[i][0].isNotEmpty &&
//           board[i][0] == board[i][1] &&
//           board[i][1] == board[i][2]) {
//         return board[i][0];
//       }
//     }

//     // Check columns
//     for (int i = 0; i < 3; i++) {
//       if (board[0][i].isNotEmpty &&
//           board[0][i] == board[1][i] &&
//           board[1][i] == board[2][i]) {
//         return board[0][i];
//       }
//     }

//     // Check diagonals
//     if (board[0][0].isNotEmpty &&
//         board[0][0] == board[1][1] &&
//         board[1][1] == board[2][2]) {
//       return board[0][0];
//     }

//     if (board[0][2].isNotEmpty &&
//         board[0][2] == board[1][1] &&
//         board[1][1] == board[2][0]) {
//       return board[0][2];
//     }

//     return null;
//   }

//   // Check for draw
//   bool _checkDraw(List<List<String>> board) {
//     return board.every((row) => row.every((cell) => cell.isNotEmpty));
//   }

//   // Update player scores
//   Future<void> _updatePlayerScores(
//     game_model.GameModel game,
//     String? winnerId,
//   ) async {
//     final batch = _firestore.batch();

//     if (winnerId != null) {
//       // Winner gets a win
//       final winnerRef = _firestore.collection('users').doc(winnerId);
//       batch.update(winnerRef, {'wins': FieldValue.increment(1)});

//       // Loser gets a loss
//       final loserId = winnerId == game.player1Id
//           ? game.player2Id
//           : game.player1Id;
//       if (loserId != null) {
//         final loserRef = _firestore.collection('users').doc(loserId);
//         batch.update(loserRef, {'losses': FieldValue.increment(1)});
//       }
//     } else {
//       // Draw - both players get a draw
//       final player1Ref = _firestore.collection('users').doc(game.player1Id);
//       batch.update(player1Ref, {'draws': FieldValue.increment(1)});

//       if (game.player2Id != null) {
//         final player2Ref = _firestore.collection('users').doc(game.player2Id!);
//         batch.update(player2Ref, {'draws': FieldValue.increment(1)});
//       }
//     }

//     await batch.commit();
//   }

//   // Get game stream
//   Stream<game_model.GameModel?> getGameStream(String gameId) {
//     return _firestore.collection('games').doc(gameId).snapshots().map((doc) {
//       if (!doc.exists) return null;
//       return game_model.GameModel.fromJson(doc.data()!);
//     });
//   }

//   // Get available games to join
//   Stream<List<game_model.GameModel>> getAvailableGames() {
//     return _firestore
//         .collection('games')
//         .where('status', isEqualTo: game_model.GameStatus.waiting.name)
//         .orderBy('createdAt', descending: true)
//         .limit(10)
//         .snapshots()
//         .map((snapshot) {
//           return snapshot.docs
//               .map((doc) => game_model.GameModel.fromJson(doc.data()))
//               .toList();
//         });
//   }

//   // Leave/Abandon game
//   Future<void> abandonGame(String gameId) async {
//     final user = _auth.currentUser;
//     if (user == null) throw 'User not authenticated';

//     await _firestore.collection('games').doc(gameId).update({
//       'status': game_model.GameStatus.abandoned.name,
//       'completedAt': DateTime.now().toIso8601String(),
//     });
//   }
// }

// // Game View Model
// final gameViewModelProvider =
//     StateNotifierProvider.family<GameViewModel, AsyncValue<String?>, String>((
//       ref,
//       gameId,
//     ) {
//       return GameViewModel(ref.read(gameServiceProvider), gameId);
//     });

// class GameViewModel extends StateNotifier<AsyncValue<String?>> {
//   GameViewModel(this._gameService, this.gameId)
//     : super(const AsyncValue.data(null));

//   final GameService _gameService;
//   final String gameId;

//   Future<void> makeMove(int row, int col) async {
//     state = const AsyncValue.loading();
//     try {
//       await _gameService.makeMove(gameId, row, col);
//       state = const AsyncValue.data('Move made successfully');
//     } catch (e) {
//       state = AsyncValue.error(e.toString(), StackTrace.current);
//     }
//   }

//   Future<void> abandonGame() async {
//     state = const AsyncValue.loading();
//     try {
//       await _gameService.abandonGame(gameId);
//       state = const AsyncValue.data('Game abandoned');
//     } catch (e) {
//       state = AsyncValue.error(e.toString(), StackTrace.current);
//     }
//   }
// }
