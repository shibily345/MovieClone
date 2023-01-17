import 'package:json_annotation/json_annotation.dart';
import 'package:netflix_app/core/constants.dart';

part 'search_resp.g.dart';

@JsonSerializable()
class SearchResp {
  @JsonKey(name: 'results')
  List<SearchResult> resSearchults;

  SearchResp({this.resSearchults = const []});

  factory SearchResp.fromJson(Map<String, dynamic> json) {
    return _$SearchRespFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchRespToJson(this);
}

@JsonSerializable()
class SearchResult {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  SearchResult({
    this.id,
    this.originalTitle,
    this.posterPath,
    this.backdropPath,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return _$SearchResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultToJson(this);
}
