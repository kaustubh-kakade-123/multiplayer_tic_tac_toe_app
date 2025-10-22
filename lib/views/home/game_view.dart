// views/game/game_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:multiplayer_tic_tac_toe_app/core/services/auth_service.dart';
import 'package:multiplayer_tic_tac_toe_app/core/services/game_service.dart';
import '../../models/game_model.dart';
import 'package:multiplayer_tic_tac_toe_app/viewmodels/game_viewmodel.dart';

class GameView extends ConsumerWidget {
  final String gameId;

  const GameView({Key? key, required this.gameId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameAsync = ref.watch(activeGameProvider(gameId));
    final gameViewModel = ref.watch(gameViewModelProvider);
    final currentUser = ref.watch(authServiceProvider).value;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic-Tac-Toe'),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => _showAbandonDialog(context, ref),
          ),
        ],
      ),
      body: gameAsync.when(
        data: (game) {
          if (game == null) {
            return const Center(child: Text('Game not found'));
          }
          return _buildGameContent(
            context,
            ref,
            game,
            currentUser,
            gameViewModel,
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildGameContent(
    BuildContext context,
    WidgetRef ref,
    GameModel game,
    User? currentUser,
    AsyncValue<void> gameViewModel,
  ) {
    final isPlayer1 = currentUser?.uid == game.player1Id;
    final isPlayer2 = currentUser?.uid == game.player2Id;
    final isCurrentPlayerTurn =
        (isPlayer1 && game.currentTurn == Player.x) ||
        (isPlayer2 && game.currentTurn == Player.o);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue.shade50, Colors.white],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildGameInfo(game, currentUser),
            const SizedBox(height: 24),
            _buildGameBoard(context, ref, game, isCurrentPlayerTurn),
            const SizedBox(height: 24),
            _buildGameStatus(game, currentUser, isCurrentPlayerTurn),
            if (gameViewModel.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  gameViewModel.error.toString(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameInfo(GameModel game, User? currentUser) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildPlayerInfo(
              game.player1Name,
              'X',
              Colors.blue,
              game.currentTurn == Player.x,
              currentUser?.uid == game.player1Id,
            ),
            const Text(
              'VS',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            _buildPlayerInfo(
              game.player2Name ?? 'Waiting...',
              'O',
              Colors.red,
              game.currentTurn == Player.o,
              currentUser?.uid == game.player2Id,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerInfo(
    String name,
    String symbol,
    Color color,
    bool isCurrentTurn,
    bool isCurrentUser,
  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isCurrentTurn ? color : Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
          child: Text(
            symbol,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isCurrentTurn ? Colors.white : Colors.grey.shade600,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isCurrentUser ? FontWeight.bold : FontWeight.normal,
            color: isCurrentUser ? Colors.blue.shade800 : Colors.black,
          ),
        ),
        if (isCurrentTurn)
          Container(
            margin: const EdgeInsets.only(top: 4),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Your Turn',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildGameBoard(
    BuildContext context,
    WidgetRef ref,
    GameModel game,
    bool isCurrentPlayerTurn,
  ) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            final row = index ~/ 3;
            final col = index % 3;
            final cellValue = game.board[row][col];

            return _buildGameCell(
              context,
              ref,
              row,
              col,
              cellValue,
              isCurrentPlayerTurn && game.status == GameStatus.inProgress,
            );
          },
        ),
      ),
    );
  }

  Widget _buildGameCell(
    BuildContext context,
    WidgetRef ref,
    int row,
    int col,
    String value,
    bool canPlay,
  ) {
    return GestureDetector(
      onTap: canPlay && value.isEmpty
          ? () => ref
                .read(gameViewModelProvider.notifier)
                .makeMove(gameId, row, col)
          : null,
      child: Container(
        decoration: BoxDecoration(
          color: value.isEmpty && canPlay
              ? Colors.blue.shade50
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: value.isEmpty && canPlay
                ? Colors.blue.shade300
                : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: value == 'X' ? Colors.blue.shade600 : Colors.red.shade600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGameStatus(
    GameModel game,
    User? currentUser,
    bool isCurrentPlayerTurn,
  ) {
    String statusText = '';
    Color statusColor = Colors.blue;

    switch (game.status) {
      case GameStatus.waiting:
        statusText = 'Waiting for another player to join...';
        statusColor = Colors.orange;
        break;
      case GameStatus.inProgress:
        if (isCurrentPlayerTurn) {
          statusText = 'Your turn!';
          statusColor = Colors.green;
        } else {
          statusText = 'Opponent\'s turn';
          statusColor = Colors.blue;
        }
        break;
      case GameStatus.completed:
        if (game.winnerId != null) {
          if (game.winnerId == currentUser?.uid) {
            statusText = '🎉 You won!';
            statusColor = Colors.green;
          } else {
            statusText = 'You lost';
            statusColor = Colors.red;
          }
        } else {
          statusText = 'It\'s a draw!';
          statusColor = Colors.orange;
        }
        break;
      case GameStatus.abandoned:
        statusText = 'Game was abandoned';
        statusColor = Colors.grey;
        break;
    }

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: statusColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          statusText,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: statusColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void _showAbandonDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Abandon Game'),
        content: const Text('Are you sure you want to abandon this game?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(gameViewModelProvider.notifier).abandonGame(gameId);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Abandon'),
          ),
        ],
      ),
    );
  }
}
