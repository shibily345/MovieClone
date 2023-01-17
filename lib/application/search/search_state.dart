part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required List<SearchResult> searchresultList,
    required List<Downloads> idleList,
    required bool isLoading,
    required bool isError,
  }) = _SearchState;
  factory SearchState.initial() => const SearchState(
        searchresultList: [],
        idleList: [],
        isLoading: false,
        isError: false,
      );
}
