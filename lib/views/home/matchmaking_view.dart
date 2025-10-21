// views/home/matchmaking_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiplayer_tic_tac_toe_app/core/services/game_service.dart';
import 'package:multiplayer_tic_tac_toe_app/core/services/score_service.dart';
import 'package:multiplayer_tic_tac_toe_app/viewmodels/matchmaking_viewmodel.dart';
import 'package:multiplayer_tic_tac_toe_app/models/game_model.dart';
import 'package:multiplayer_tic_tac_toe_app/models/score_model.dart';
import 'package:multiplayer_tic_tac_toe_app/views/home/game_view.dart';

class MatchmakingView extends ConsumerWidget {
  const MatchmakingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userScore = ref.watch(userScoreProvider);
    final availableGames = ref.watch(availableGamesProvider);
    final matchmakingState = ref.watch(matchmakingViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic-Tac-Toe'),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
      ),
      body: Container(
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildUserStats(userScore),
              const SizedBox(height: 24),
              _buildQuickActions(context, ref, matchmakingState),
              const SizedBox(height: 24),
              _buildAvailableGames(context, ref, availableGames),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserStats(AsyncValue<ScoreModel?> userScore) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: userScore.when(
          data: (score) {
            // Create default values when score is null
            final displayName = score?.displayName ?? 'Player';
            final wins = score?.wins ?? 0;
            final losses = score?.losses ?? 0;
            final draws = score?.draws ?? 0;
            final winRate = score?.winRate ?? 0.0;

            return Column(
              children: [
                Text(
                  'Welcome back, $displayName!',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem('Wins', wins.toString(), Colors.green),
                    _buildStatItem('Losses', losses.toString(), Colors.red),
                    _buildStatItem('Draws', draws.toString(), Colors.orange),
                    _buildStatItem(
                      'Win Rate',
                      '${(winRate * 100).toStringAsFixed(1)}%',
                      Colors.blue,
                    ),
                  ],
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Text('Error: $error'),
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  Widget _buildQuickActions(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<String?> matchmakingState,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Quick Play',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ElevatedButton.icon(
          onPressed: matchmakingState.isLoading
              ? null
              : () => _findMatch(context, ref),
          icon: const Icon(Icons.flash_on),
          label: const Text('Quick Match'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: matchmakingState.isLoading
              ? null
              : () => _findRankedMatch(context, ref),
          icon: const Icon(Icons.trending_up),
          label: const Text('Ranked Match'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: matchmakingState.isLoading
              ? null
              : () => _createGame(context, ref),
          icon: const Icon(Icons.add),
          label: const Text('Create Game'),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        if (matchmakingState.isLoading)
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }

  Widget _buildAvailableGames(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<List<GameModel>> availableGames,
  ) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Available Games',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: availableGames.when(
              data: (games) {
                if (games.isEmpty) {
                  return const Center(
                    child: Text(
                      'No available games.\nCreate a new one!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: games.length,
                  itemBuilder: (context, index) {
                    final game = games[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue.shade100,
                          child: Text(
                            game.player1Name[0].toUpperCase(),
                            style: TextStyle(
                              color: Colors.blue.shade800,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text('${game.player1Name}\'s Game'),
                        subtitle: Text(
                          'Created ${_formatTime(game.createdAt)}',
                        ),
                        trailing: ElevatedButton(
                          onPressed: () => _joinGame(context, ref, game.id),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Join'),
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error: $error')),
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }

  void _findMatch(BuildContext context, WidgetRef ref) async {
    final gameId = await ref
        .read(matchmakingViewModelProvider.notifier)
        .findMatch();
    if (gameId != null && context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GameView(gameId: gameId)),
      );
    }
  }

  void _findRankedMatch(BuildContext context, WidgetRef ref) async {
    final gameId = await ref
        .read(matchmakingViewModelProvider.notifier)
        .findRankedMatch();
    if (gameId != null && context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GameView(gameId: gameId)),
      );
    }
  }

  void _createGame(BuildContext context, WidgetRef ref) async {
    try {
      final gameId = await ref.read(gameServiceProvider).createGame();
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GameView(gameId: gameId)),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to create game: $e')));
      }
    }
  }

  void _joinGame(BuildContext context, WidgetRef ref, String gameId) async {
    try {
      await ref.read(gameServiceProvider).joinGame(gameId);
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GameView(gameId: gameId)),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to join game: $e')));
      }
    }
  }
}
