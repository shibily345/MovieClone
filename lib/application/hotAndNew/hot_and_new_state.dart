part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState({
    required List<HotAndNewData> comingSoonList,
    required List<HotAndNewData> evoryOnesWatching,
    required bool isLoading,
    required bool isError,
  }) = _Initial;
  factory HotAndNewState.initial() => const HotAndNewState(
        comingSoonList: [],
        evoryOnesWatching: [],
        isError: false,
        isLoading: false,
      );
}
