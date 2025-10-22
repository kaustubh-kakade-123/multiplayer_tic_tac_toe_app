// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchmaking_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MatchmakingViewModel)
const matchmakingViewModelProvider = MatchmakingViewModelProvider._();

final class MatchmakingViewModelProvider
    extends $NotifierProvider<MatchmakingViewModel, AsyncValue<String?>> {
  const MatchmakingViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'matchmakingViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$matchmakingViewModelHash();

  @$internal
  @override
  MatchmakingViewModel create() => MatchmakingViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<String?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<String?>>(value),
    );
  }
}

String _$matchmakingViewModelHash() =>
    r'9e83b45abf5fa8685cc1f51e180c2eb836d791eb';

abstract class _$MatchmakingViewModel extends $Notifier<AsyncValue<String?>> {
  AsyncValue<String?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<String?>, AsyncValue<String?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String?>, AsyncValue<String?>>,
              AsyncValue<String?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
