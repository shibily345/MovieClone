import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/HotAndNew/models/hot_and_new/hot_and_new.dart';
import 'package:netflix_app/domain/HotAndNew/models/hot_and_new/hot_and_new_service.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService _homeService;
  @override
  HomeBloc(this._homeService) : super(HomeState.initial()) {
    on<GetHomeScreenData>((event, emit) async {
      emit(state.copyWith(
        stateId: DateTime.now().millisecondsSinceEpoch.toString(),
        pastYearListMovies: [],
        trendingMovielist: [],
        tensDramamovieList: [],
        southIndianMovielist: [],
        trndingTvList: [],
        isLoading: true,
        hasError: false,
      ));
      final _movieResult = await _homeService.getHotANdNewData();
      final _tvResult = await _homeService.getHotANdNewTvData();
      final _state1 = _movieResult.fold(
        (MainFailure failure) {
          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearListMovies: [],
            trendingMovielist: [],
            tensDramamovieList: [],
            southIndianMovielist: [],
            trndingTvList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNew resp) {
          final pastYear = resp.results;
          final trending = resp.results;
          final tensdrama = resp.results;
          final trndingsiv = resp.results;
          pastYear.shuffle();
          trending.shuffle();
          tensdrama.shuffle();
          trndingsiv.shuffle();
          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearListMovies: pastYear,
            trendingMovielist: trending,
            tensDramamovieList: tensdrama,
            southIndianMovielist: trndingsiv,
            trndingTvList: state.trndingTvList,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(_state1);
      final _state2 = _tvResult.fold(
        (MainFailure f) {
          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearListMovies: [],
            trendingMovielist: [],
            tensDramamovieList: [],
            southIndianMovielist: [],
            trndingTvList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNew resp) {
          final top10List = resp.results;
          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearListMovies: state.pastYearListMovies,
            trendingMovielist: state.trendingMovielist,
            tensDramamovieList: state.tensDramamovieList,
            southIndianMovielist: state.southIndianMovielist,
            trndingTvList: top10List,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(_state2);
    });
  }
}
