// lib/viewmodels/profile_viewmodel.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../core/services/score_service.dart';
import '../models/score_model.dart';

part 'profile_viewmodel.g.dart';

@riverpod
class ProfileViewModel extends _$ProfileViewModel {
  @override
  AsyncValue<ScoreModel?> build() {
    // Use the score service's stream provider
    return const AsyncValue.data(null);
  }

  ScoreService get _service => ref.read(scoreServiceProvider);

  Stream<ScoreModel?> watchUserScore() => _service.getCurrentUserScore();

  Stream<List<ScoreModel>> watchLeaderboard() => _service.getLeaderboard();

  Stream<List<dynamic>> watchGameHistory() =>
      _service.getUserGameHistory().map((e) => e);
}
