import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/Downloads/i_downloads_rapo.dart';

import '../../domain/Downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyvideoUrl = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
];
ValueNotifier<Set<int>> likedVideoNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(IDownloadsRapo _downloadservice)
      : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      emit(const FastLaughState(
        videoList: [],
        isLoading: true,
        isError: false,
      ));
      final _result = await _downloadservice.getDownloadsImages();
      final _state = _result.fold(
        (l) {
          return FastLaughState(
            videoList: [],
            isLoading: false,
            isError: true,
          );
        },
        (resp) => FastLaughState(
          videoList: resp,
          isLoading: false,
          isError: false,
        ),
      );
      emit(_state);
    });
    on<Likevideo>((event, emit) {
      likedVideoNotifier.value.add(event.id);
      likedVideoNotifier.notifyListeners();
    });
    on<UnlikeVideo>((event, emit) {
      likedVideoNotifier.value.remove(event.id);
      likedVideoNotifier.notifyListeners();
    });
  }
}
