import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/search/model/search_service.dart';

import '../../domain/Downloads/i_downloads_rapo.dart';
import '../../domain/Downloads/models/downloads.dart';
import '../../domain/core/failures/main_failure.dart';
import '../../domain/search/model/search_resp/search_resp.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRapo _downloadsservices;
  final searchServices _serchServices;
  SearchBloc(this._downloadsservices, this._serchServices)
      : super(SearchState.initial()) {
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(SearchState(
          searchresultList: [],
          idleList: state.idleList,
          isLoading: false,
          isError: false,
        ));
        return;
      }
      emit(const SearchState(
        searchresultList: [],
        idleList: [],
        isLoading: true,
        isError: false,
      ));

      final _result = await _downloadsservices.getDownloadsImages();
      final _state = _result.fold(
        (MainFailure f) {
          return const SearchState(
            searchresultList: [],
            idleList: [],
            isLoading: false,
            isError: true,
          );
        },
        (List<Downloads> list) {
          return SearchState(
            searchresultList: [],
            idleList: list,
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(_state);
    });
    on<SearchMovie>((event, emit) async {
      final _result =
          await _serchServices.searchMovies(movieQuery: event.movieQuery);
      final _state = _result.fold(
        (MainFailure f) {
          return const SearchState(
            searchresultList: [],
            idleList: [],
            isLoading: false,
            isError: true,
          );
        },
        (SearchResp r) {
          return SearchState(
            searchresultList: r.resSearchults,
            idleList: [],
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(_state);
    });
  }
}
