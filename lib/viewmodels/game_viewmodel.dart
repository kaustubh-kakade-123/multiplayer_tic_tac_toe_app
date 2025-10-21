// lib/viewmodels/game_viewmodel.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/services/game_service.dart';

part 'game_viewmodel.g.dart';

@riverpod
class GameViewModel extends _$GameViewModel {
  @override
  AsyncValue<void> build() {
    return const AsyncValue.data(null);
  }

  GameService get _service => ref.read(gameServiceProvider);

  /// Creates a new game and returns the gameId
  Future<String> createGame() async {
    state = const AsyncValue.loading();
    try {
      final id = await _service.createGame();
      state = const AsyncValue.data(null);
      return id;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<void> joinGame(String gameId) async {
    state = const AsyncValue.loading();
    try {
      await _service.joinGame(gameId);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<void> makeMove(String gameId, int row, int col) async {
    state = const AsyncValue.loading();
    try {
      await _service.makeMove(gameId, row, col);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  Future<void> abandonGame(String gameId) async {
    state = const AsyncValue.loading();
    try {
      await _service.abandonGame(gameId);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }
}
