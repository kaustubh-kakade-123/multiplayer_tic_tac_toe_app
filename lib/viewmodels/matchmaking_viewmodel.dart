import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../core/services/matchmaking_service.dart';

part 'matchmaking_viewmodel.g.dart';

@riverpod
class MatchmakingViewModel extends _$MatchmakingViewModel {
  @override
  AsyncValue<String?> build() {
    return const AsyncValue.data(null);
  }

  MatchmakingService get _service => ref.read(matchmakingServiceProvider);

  Future<String?> findMatch() async {
    state = const AsyncValue.loading();
    try {
      final gameId = await _service.findMatch();
      state = AsyncValue.data(gameId);
      return gameId;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  Future<String?> findRankedMatch() async {
    state = const AsyncValue.loading();
    try {
      final gameId = await _service.findRankedMatch();
      state = AsyncValue.data(gameId);
      return gameId;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }
}
