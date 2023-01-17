part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughEvent with _$FastLaughEvent {
  const factory FastLaughEvent.initialize() = Initialize;
  const factory FastLaughEvent.likevideo({required int id}) = Likevideo;
  const factory FastLaughEvent.unlikeVideo({required int id}) = UnlikeVideo;
}
