part of 'downloads_bloc.dart';

@freezed
class DownloadsSatate with _$DownloadsSatate {
  const factory DownloadsSatate({
    required bool isLoading,
    required List<Downloads>? downloads,
    required Option<Either<MainFailure, List<Downloads>>>
        downloadsFailureOrSuccessOption,
  }) = _DownloadsSatate;
  factory DownloadsSatate.inital() {
    return const DownloadsSatate(
      isLoading: false,
      downloadsFailureOrSuccessOption: None(),
      downloads: [],
    );
  }
}
