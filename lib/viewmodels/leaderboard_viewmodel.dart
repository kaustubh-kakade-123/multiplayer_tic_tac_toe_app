// lib/viewmodels/leaderboard_viewmodel.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../core/services/score_service.dart';
import '../models/score_model.dart';

part 'leaderboard_viewmodel.g.dart';

@riverpod
class LeaderboardViewModel extends _$LeaderboardViewModel {
  @override
  AsyncValue<List<ScoreModel>> build() {
    return const AsyncValue.data([]);
  }

  ScoreService get _service => ref.read(scoreServiceProvider);

  Stream<List<ScoreModel>> watchLeaderboard() => _service.getLeaderboard();
}
