// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResp _$SearchRespFromJson(Map<String, dynamic> json) => SearchResp(
      resSearchults: (json['results'] as List<dynamic>?)
              ?.map((e) => SearchResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SearchRespToJson(SearchResp instance) =>
    <String, dynamic>{
      'results': instance.resSearchults,
    };

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) => SearchResult(
      id: json['id'] as int?,
      originalTitle: json['original_title'] as String?,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
    );

Map<String, dynamic> _$SearchResultToJson(SearchResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
    };
