import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/HotAndNew/models/hot_and_new/hot_and_new.dart';
import 'package:netflix_app/domain/HotAndNew/models/hot_and_new/hot_and_new_service.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotandnewservice;
  HotAndNewBloc(this._hotandnewservice) : super(HotAndNewState.initial()) {
    on<LoaddatainComingsoon>((event, emit) async {
      emit(const HotAndNewState(
        comingSoonList: [],
        evoryOnesWatching: [],
        isLoading: true,
        isError: false,
      ));
      final _result = await _hotandnewservice.getHotANdNewData();
      final newState = _result.fold(
        (MainFailure f) {
          return const HotAndNewState(
            comingSoonList: [],
            evoryOnesWatching: [],
            isLoading: false,
            isError: true,
          );
        },
        (HotAndNew resp) {
          return HotAndNewState(
            comingSoonList: resp.results,
            evoryOnesWatching: state.evoryOnesWatching,
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(newState);
    });
    on<LoaddatainEveryOneWcthing>((event, emit) async {
      emit(const HotAndNewState(
        comingSoonList: [],
        evoryOnesWatching: [],
        isLoading: true,
        isError: false,
      ));
      final _result = await _hotandnewservice.getHotANdNewTvData();
      final newState = _result.fold(
        (MainFailure f) {
          return const HotAndNewState(
            comingSoonList: [],
            evoryOnesWatching: [],
            isLoading: false,
            isError: true,
          );
        },
        (HotAndNew resp) {
          return HotAndNewState(
            comingSoonList: state.comingSoonList,
            evoryOnesWatching: resp.results,
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(newState);
    });
  }
}
