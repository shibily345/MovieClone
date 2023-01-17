import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/HotAndNew/models/hot_and_new/hot_and_new.dart';

import '../../../core/failures/main_failure.dart';

abstract class HotAndNewService {
  Future<Either<MainFailure, HotAndNew>> getHotANdNewData();
  Future<Either<MainFailure, HotAndNew>> getHotANdNewTvData();
}
