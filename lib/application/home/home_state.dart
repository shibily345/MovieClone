part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required List<HotAndNewData> pastYearListMovies,
    required List<HotAndNewData> trendingMovielist,
    required List<HotAndNewData> tensDramamovieList,
    required List<HotAndNewData> southIndianMovielist,
    required List<HotAndNewData> trndingTvList,
    required bool isLoading,
    required bool hasError,
    required String stateId,
  }) = _Initial;
  factory HomeState.initial() => const HomeState(
        stateId: '0',
        pastYearListMovies: [],
        trendingMovielist: [],
        tensDramamovieList: [],
        southIndianMovielist: [],
        trndingTvList: [],
        isLoading: false,
        hasError: false,
      );
}
