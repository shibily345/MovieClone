// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:netflix_app/application/Downloads/downloads_bloc.dart' as _i9;
import 'package:netflix_app/application/home/home_bloc.dart' as _i11;
import 'package:netflix_app/application/hotAndNew/hot_and_new_bloc.dart'
    as _i12;
import 'package:netflix_app/application/reel/fast_laugh_bloc.dart' as _i10;
import 'package:netflix_app/application/search/search_bloc.dart' as _i13;
import 'package:netflix_app/domain/Downloads/i_downloads_rapo.dart' as _i5;
import 'package:netflix_app/domain/HotAndNew/models/hot_and_new/hot_and_new_service.dart'
    as _i3;
import 'package:netflix_app/domain/search/model/search_service.dart' as _i7;
import 'package:netflix_app/infrastructure/downloads/downloads_repository.dart'
    as _i6;
import 'package:netflix_app/infrastructure/hotAndNew/hot_a_new_impl.dart'
    as _i4;
import 'package:netflix_app/infrastructure/search/search_impl.dart' as _i8;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.HotAndNewService>(() => _i4.hotAndNewImplements());
    gh.lazySingleton<_i5.IDownloadsRapo>(() => _i6.DownloadsRepository());
    gh.lazySingleton<_i7.searchServices>(() => _i8.Serchimpl());
    gh.factory<_i9.DownloadsBloc>(
        () => _i9.DownloadsBloc(gh<_i5.IDownloadsRapo>()));
    gh.factory<_i10.FastLaughBloc>(
        () => _i10.FastLaughBloc(gh<_i5.IDownloadsRapo>()));
    gh.factory<_i11.HomeBloc>(() => _i11.HomeBloc(gh<_i3.HotAndNewService>()));
    gh.factory<_i12.HotAndNewBloc>(
        () => _i12.HotAndNewBloc(gh<_i3.HotAndNewService>()));
    gh.factory<_i13.SearchBloc>(() => _i13.SearchBloc(
          gh<_i5.IDownloadsRapo>(),
          gh<_i7.searchServices>(),
        ));
    return this;
  }
}
