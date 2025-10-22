// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LeaderboardViewModel)
const leaderboardViewModelProvider = LeaderboardViewModelProvider._();

final class LeaderboardViewModelProvider
    extends
        $NotifierProvider<LeaderboardViewModel, AsyncValue<List<ScoreModel>>> {
  const LeaderboardViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'leaderboardViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$leaderboardViewModelHash();

  @$internal
  @override
  LeaderboardViewModel create() => LeaderboardViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<ScoreModel>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<ScoreModel>>>(value),
    );
  }
}

String _$leaderboardViewModelHash() =>
    r'd891a29cfc7072f9cd3a33f3e27333a4a64dbdb9';

abstract class _$LeaderboardViewModel
    extends $Notifier<AsyncValue<List<ScoreModel>>> {
  AsyncValue<List<ScoreModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<List<ScoreModel>>, AsyncValue<List<ScoreModel>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<ScoreModel>>,
                AsyncValue<List<ScoreModel>>
              >,
              AsyncValue<List<ScoreModel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
