// views/profile/profile_view.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiplayer_tic_tac_toe_app/core/services/auth_service.dart';
import 'package:multiplayer_tic_tac_toe_app/core/services/score_service.dart';
import 'package:multiplayer_tic_tac_toe_app/viewmodels/auth_viewmodel.dart';

import '../../models/game_model.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(authServiceProvider).value;
    final userScore = ref.watch(userScoreProvider);
    final gameHistory = ref.watch(
      scoreServiceProvider.select((service) => service.getUserGameHistory()),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _showSignOutDialog(context, ref),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade50, Colors.white],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildUserCard(currentUser, userScore),
              const SizedBox(height: 24),
              _buildStatsCards(userScore),
              const SizedBox(height: 24),
              _buildGameHistory(gameHistory, currentUser),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserCard(User? currentUser, AsyncValue userScore) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade600, Colors.blue.shade400],
          ),
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              backgroundImage: currentUser?.photoURL != null
                  ? NetworkImage(currentUser!.photoURL!)
                  : null,
              child: currentUser?.photoURL == null
                  ? Text(
                      currentUser?.displayName?.isNotEmpty == true
                          ? currentUser!.displayName![0].toUpperCase()
                          : 'U',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade600,
                      ),
                    )
                  : null,
            ),
            const SizedBox(height: 16),
            Text(
              currentUser?.displayName ?? 'Player',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              currentUser?.email ?? '',
              style: const TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCards(AsyncValue userScore) {
    return userScore.when(
      data: (score) {
        if (score == null) return const SizedBox.shrink();

        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Wins',
                    score.wins.toString(),
                    Icons.emoji_events,
                    Colors.green,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Losses',
                    score.losses.toString(),
                    Icons.close,
                    Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Draws',
                    score.draws.toString(),
                    Icons.remove,
                    Colors.orange,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Win Rate',
                    '${(score.winRate * 100).toStringAsFixed(1)}%',
                    Icons.trending_up,
                    Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Text('Error loading stats: $error'),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color.withOpacity(0.1),
        ),
        child: Column(
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildGameHistory(
  //   Stream<List<GameModel>> gameHistoryStream,
  //   User? currentUser,
  // ) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const Text(
  //         'Recent Games',
  //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //       ),
  //       const SizedBox(height: 12),
  //       StreamBuilder<List<GameModel>>(
  //         stream: gameHistoryStream,
  //         builder: (context, snapshot) {
  //           if (snapshot.hasError) {
  //             return Text('Error: ${snapshot.error}');
  //           }

  //           if (!snapshot.hasData) {
  //             return const Center(child: CircularProgressIndicator());
  //           }

  //           final games = snapshot.data!;

  //           if (games.isEmpty) {
  //             return const Card(
  //               child: Padding(
  //                 padding: EdgeInsets.all(16.0),
  //                 child: Text(
  //                   'No games played yet.\nStart playing to see your game history!',
  //                   textAlign: TextAlign.center,
  //                   style: TextStyle(fontSize: 16, color: Colors.grey),
  //                 ),
  //               ),
  //             );
  //           }

  //           return ListView.builder(
  //             shrinkWrap: true,
  //             physics: const NeverScrollableScrollPhysics(),
  //             itemCount: games.length,
  //             itemBuilder: (context, index) {
  //               final game = games[index];
  //               return _buildGameHistoryCard(game, currentUser);
  //             },
  //           );
  //         },
  //       ),
  //     ],
  //   );
  // }

  Widget _buildGameHistory(
    Stream<List<GameModel>> gameHistoryStream,
    User? currentUser,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Games',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        StreamBuilder<List<GameModel>>(
          stream: gameHistoryStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Error loading games: ${snapshot.error}',
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              );
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'No games played yet.\nStart playing to see your game history!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              );
            }

            final games = snapshot.data!;

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: games.length,
              itemBuilder: (context, index) {
                try {
                  final game = games[index];
                  return _buildGameHistoryCard(game, currentUser);
                } catch (e) {
                  // Handle individual game parsing errors
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: const Icon(Icons.error, color: Colors.red),
                      title: const Text('Error loading game'),
                      subtitle: Text('Error: $e'),
                    ),
                  );
                }
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildGameHistoryCard(GameModel game, User? currentUser) {
    final isWinner = game.winnerId == currentUser?.uid;
    final isDraw = game.winnerId == null;
    final opponentName = game.player1Id == currentUser?.uid
        ? (game.player2Name ?? 'Unknown')
        : game.player1Name;

    Color resultColor;
    String resultText;
    IconData resultIcon;

    if (isDraw) {
      resultColor = Colors.orange;
      resultText = 'Draw';
      resultIcon = Icons.remove;
    } else if (isWinner) {
      resultColor = Colors.green;
      resultText = 'Win';
      resultIcon = Icons.check;
    } else {
      resultColor = Colors.red;
      resultText = 'Loss';
      resultIcon = Icons.close;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: resultColor.withOpacity(0.2),
          child: Icon(resultIcon, color: resultColor),
        ),
        title: Text('vs $opponentName'),
        subtitle: Text(
          game.completedAt != null
              ? _formatGameDate(game.completedAt!)
              : 'In progress',
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: resultColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            resultText,
            style: TextStyle(
              color: resultColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  String _formatGameDate(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 7) {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  void _showSignOutDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(authViewModelProvider.notifier).signOut();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
