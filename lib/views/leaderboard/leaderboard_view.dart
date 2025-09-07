// views/leaderboard/leaderboard_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiplayer_tic_tac_toe_app/core/services/leaderboard_service.dart';
import '../../models/score_model.dart';

class LeaderboardView extends ConsumerStatefulWidget {
  const LeaderboardView({super.key});

  @override
  ConsumerState<LeaderboardView> createState() => _LeaderboardViewState();
}

class _LeaderboardViewState extends ConsumerState<LeaderboardView>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: 'All Time'),
            Tab(text: 'This Month'),
            Tab(text: 'This Week'),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade50, Colors.white],
          ),
        ),
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildLeaderboardTab(ref.watch(globalLeaderboardProvider)),
            _buildLeaderboardTab(ref.watch(monthlyLeaderboardProvider)),
            _buildLeaderboardTab(ref.watch(weeklyLeaderboardProvider)),
          ],
        ),
      ),
    );
  }

  Widget _buildLeaderboardTab(AsyncValue<List<ScoreModel>> leaderboardAsync) {
    return leaderboardAsync.when(
      data: (leaderboard) {
        if (leaderboard.isEmpty) {
          return const Center(
            child: Text(
              'No players yet.\nBe the first to play!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }

        return Column(
          children: [
            if (leaderboard.isNotEmpty)
              _buildTopThree(leaderboard.take(3).toList()),
            const SizedBox(height: 16),
            Expanded(child: _buildLeaderboardList(leaderboard)),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) {
        // Print full error and stack trace in console
        debugPrint("Firestore error: $error");
        debugPrintStack(stackTrace: stack);

        // Still show the error in the UI
        return Center(child: Text('Error: $error'));
      },
    );
  }

  Widget _buildTopThree(List<ScoreModel> topPlayers) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (topPlayers.length > 1) _buildPodiumPlayer(topPlayers[1], 2, 120),
          if (topPlayers.isNotEmpty) _buildPodiumPlayer(topPlayers[0], 1, 140),
          if (topPlayers.length > 2) _buildPodiumPlayer(topPlayers[2], 3, 100),
        ],
      ),
    );
  }

  Widget _buildPodiumPlayer(ScoreModel player, int rank, double height) {
    Color rankColor;
    IconData rankIcon;

    switch (rank) {
      case 1:
        rankColor = Colors.amber;
        rankIcon = Icons.emoji_events;
        break;
      case 2:
        rankColor = Colors.grey;
        rankIcon = Icons.emoji_events;
        break;
      case 3:
        rankColor = Colors.orange.shade800;
        rankIcon = Icons.emoji_events;
        break;
      default:
        rankColor = Colors.blue;
        rankIcon = Icons.person;
    }

    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: rankColor.withOpacity(0.2),
          child: Text(
            player.displayName[0].toUpperCase(),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: rankColor,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          player.displayName,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '${player.wins}W ${player.losses}L',
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
        Text(
          '${(player.winRate * 100).toStringAsFixed(1)}%',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: rankColor,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 60,
          height: height,
          decoration: BoxDecoration(
            color: rankColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(rankIcon, color: Colors.white, size: 24),
              Text(
                '#$rank',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLeaderboardList(List<ScoreModel> leaderboard) {
    return ListView.builder(
      itemCount: leaderboard.length,
      itemBuilder: (context, index) {
        final player = leaderboard[index];
        final rank = index + 1;

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          elevation: 2,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: _getRankColor(rank).withOpacity(0.2),
              child: Text(
                '#$rank',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _getRankColor(rank),
                  fontSize: 12,
                ),
              ),
            ),
            title: Text(
              player.displayName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '${player.totalGames} games played',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${(player.winRate * 100).toStringAsFixed(1)}%',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: _getRankColor(rank),
                  ),
                ),
                Text(
                  '${player.wins}W ${player.losses}L ${player.draws}D',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _getRankColor(int rank) {
    if (rank <= 3) {
      switch (rank) {
        case 1:
          return Colors.amber;
        case 2:
          return Colors.grey;
        case 3:
          return Colors.orange.shade800;
      }
    }
    return Colors.blue;
  }
}
