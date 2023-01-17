import 'package:dartz/dartz.dart';

import 'package:netflix_app/domain/Downloads/models/downloads.dart';

import '../core/failures/main_failure.dart';

abstract class IDownloadsRapo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
}
