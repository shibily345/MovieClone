import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/HotAndNew/models/hot_and_new/hot_and_new.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/HotAndNew/models/hot_and_new/hot_and_new_service.dart';
import 'package:netflix_app/domain/core/api_end_points.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';

@LazySingleton(as: HotAndNewService)
class hotAndNewImplements implements HotAndNewService {
  @override
  Future<Either<MainFailure, HotAndNew>> getHotANdNewData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndponts.hotNewTvMovie,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNew.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverfailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HotAndNew>> getHotANdNewTvData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndponts.hotNewTv,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNew.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverfailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
