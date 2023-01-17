import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:netflix_app/domain/Downloads/i_downloads_rapo.dart';

import '../../domain/Downloads/models/downloads.dart';
import '../../domain/core/failures/main_failure.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsSatate> {
  final IDownloadsRapo _downloadsRapo;
  DownloadsBloc(this._downloadsRapo) : super(DownloadsSatate.inital()) {
    on<_GetDownloadsImage>(
      (event, emit) async {
        emit(
          state.copyWith(
            isLoading: false,
            downloadsFailureOrSuccessOption: const None(),
          ),
        );
        final Either<MainFailure, List<Downloads>> downloadsOption =
            await _downloadsRapo.getDownloadsImages();
        log(downloadsOption.toString());
        emit(downloadsOption.fold(
          (failure) => state.copyWith(
              isLoading: false,
              downloadsFailureOrSuccessOption: Some(
                Left(failure),
              )),
          (success) => state.copyWith(
            isLoading: false,
            downloads: success,
            downloadsFailureOrSuccessOption: Some(
              Right(success),
            ),
          ),
        ));
      },
    );
  }
}
