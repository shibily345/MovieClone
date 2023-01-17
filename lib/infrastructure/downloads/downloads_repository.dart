import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/Downloads/i_downloads_rapo.dart';
import 'package:netflix_app/domain/Downloads/models/downloads.dart';

import '../../domain/core/api_end_points.dart';
import '../../domain/core/failures/main_failure.dart';

@LazySingleton(as: IDownloadsRapo)
class DownloadsRepository implements IDownloadsRapo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndponts.Downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadsList = (response.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();

        print(downloadsList);
        return Right(downloadsList);
      } else {
        return const Left(MainFailure.serverfailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
