// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomeScreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getHomeScreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomeScreenData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeScreenData value) getHomeScreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHomeScreenData value)? getHomeScreenData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeScreenData value)? getHomeScreenData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetHomeScreenDataCopyWith<$Res> {
  factory _$$GetHomeScreenDataCopyWith(
          _$GetHomeScreenData value, $Res Function(_$GetHomeScreenData) then) =
      __$$GetHomeScreenDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetHomeScreenDataCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetHomeScreenData>
    implements _$$GetHomeScreenDataCopyWith<$Res> {
  __$$GetHomeScreenDataCopyWithImpl(
      _$GetHomeScreenData _value, $Res Function(_$GetHomeScreenData) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetHomeScreenData implements GetHomeScreenData {
  const _$GetHomeScreenData();

  @override
  String toString() {
    return 'HomeEvent.getHomeScreenData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetHomeScreenData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomeScreenData,
  }) {
    return getHomeScreenData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getHomeScreenData,
  }) {
    return getHomeScreenData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomeScreenData,
    required TResult orElse(),
  }) {
    if (getHomeScreenData != null) {
      return getHomeScreenData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeScreenData value) getHomeScreenData,
  }) {
    return getHomeScreenData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHomeScreenData value)? getHomeScreenData,
  }) {
    return getHomeScreenData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeScreenData value)? getHomeScreenData,
    required TResult orElse(),
  }) {
    if (getHomeScreenData != null) {
      return getHomeScreenData(this);
    }
    return orElse();
  }
}

abstract class GetHomeScreenData implements HomeEvent {
  const factory GetHomeScreenData() = _$GetHomeScreenData;
}

/// @nodoc
mixin _$HomeState {
  List<HotAndNewData> get pastYearListMovies =>
      throw _privateConstructorUsedError;
  List<HotAndNewData> get trendingMovielist =>
      throw _privateConstructorUsedError;
  List<HotAndNewData> get tensDramamovieList =>
      throw _privateConstructorUsedError;
  List<HotAndNewData> get southIndianMovielist =>
      throw _privateConstructorUsedError;
  List<HotAndNewData> get trndingTvList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String get stateId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {List<HotAndNewData> pastYearListMovies,
      List<HotAndNewData> trendingMovielist,
      List<HotAndNewData> tensDramamovieList,
      List<HotAndNewData> southIndianMovielist,
      List<HotAndNewData> trndingTvList,
      bool isLoading,
      bool hasError,
      String stateId});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pastYearListMovies = null,
    Object? trendingMovielist = null,
    Object? tensDramamovieList = null,
    Object? southIndianMovielist = null,
    Object? trndingTvList = null,
    Object? isLoading = null,
    Object? hasError = null,
    Object? stateId = null,
  }) {
    return _then(_value.copyWith(
      pastYearListMovies: null == pastYearListMovies
          ? _value.pastYearListMovies
          : pastYearListMovies // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trendingMovielist: null == trendingMovielist
          ? _value.trendingMovielist
          : trendingMovielist // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      tensDramamovieList: null == tensDramamovieList
          ? _value.tensDramamovieList
          : tensDramamovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      southIndianMovielist: null == southIndianMovielist
          ? _value.southIndianMovielist
          : southIndianMovielist // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trndingTvList: null == trndingTvList
          ? _value.trndingTvList
          : trndingTvList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<HotAndNewData> pastYearListMovies,
      List<HotAndNewData> trendingMovielist,
      List<HotAndNewData> tensDramamovieList,
      List<HotAndNewData> southIndianMovielist,
      List<HotAndNewData> trndingTvList,
      bool isLoading,
      bool hasError,
      String stateId});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pastYearListMovies = null,
    Object? trendingMovielist = null,
    Object? tensDramamovieList = null,
    Object? southIndianMovielist = null,
    Object? trndingTvList = null,
    Object? isLoading = null,
    Object? hasError = null,
    Object? stateId = null,
  }) {
    return _then(_$_Initial(
      pastYearListMovies: null == pastYearListMovies
          ? _value._pastYearListMovies
          : pastYearListMovies // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trendingMovielist: null == trendingMovielist
          ? _value._trendingMovielist
          : trendingMovielist // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      tensDramamovieList: null == tensDramamovieList
          ? _value._tensDramamovieList
          : tensDramamovieList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      southIndianMovielist: null == southIndianMovielist
          ? _value._southIndianMovielist
          : southIndianMovielist // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      trndingTvList: null == trndingTvList
          ? _value._trndingTvList
          : trndingTvList // ignore: cast_nullable_to_non_nullable
              as List<HotAndNewData>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required final List<HotAndNewData> pastYearListMovies,
      required final List<HotAndNewData> trendingMovielist,
      required final List<HotAndNewData> tensDramamovieList,
      required final List<HotAndNewData> southIndianMovielist,
      required final List<HotAndNewData> trndingTvList,
      required this.isLoading,
      required this.hasError,
      required this.stateId})
      : _pastYearListMovies = pastYearListMovies,
        _trendingMovielist = trendingMovielist,
        _tensDramamovieList = tensDramamovieList,
        _southIndianMovielist = southIndianMovielist,
        _trndingTvList = trndingTvList;

  final List<HotAndNewData> _pastYearListMovies;
  @override
  List<HotAndNewData> get pastYearListMovies {
    if (_pastYearListMovies is EqualUnmodifiableListView)
      return _pastYearListMovies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pastYearListMovies);
  }

  final List<HotAndNewData> _trendingMovielist;
  @override
  List<HotAndNewData> get trendingMovielist {
    if (_trendingMovielist is EqualUnmodifiableListView)
      return _trendingMovielist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingMovielist);
  }

  final List<HotAndNewData> _tensDramamovieList;
  @override
  List<HotAndNewData> get tensDramamovieList {
    if (_tensDramamovieList is EqualUnmodifiableListView)
      return _tensDramamovieList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tensDramamovieList);
  }

  final List<HotAndNewData> _southIndianMovielist;
  @override
  List<HotAndNewData> get southIndianMovielist {
    if (_southIndianMovielist is EqualUnmodifiableListView)
      return _southIndianMovielist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_southIndianMovielist);
  }

  final List<HotAndNewData> _trndingTvList;
  @override
  List<HotAndNewData> get trndingTvList {
    if (_trndingTvList is EqualUnmodifiableListView) return _trndingTvList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trndingTvList);
  }

  @override
  final bool isLoading;
  @override
  final bool hasError;
  @override
  final String stateId;

  @override
  String toString() {
    return 'HomeState(pastYearListMovies: $pastYearListMovies, trendingMovielist: $trendingMovielist, tensDramamovieList: $tensDramamovieList, southIndianMovielist: $southIndianMovielist, trndingTvList: $trndingTvList, isLoading: $isLoading, hasError: $hasError, stateId: $stateId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality()
                .equals(other._pastYearListMovies, _pastYearListMovies) &&
            const DeepCollectionEquality()
                .equals(other._trendingMovielist, _trendingMovielist) &&
            const DeepCollectionEquality()
                .equals(other._tensDramamovieList, _tensDramamovieList) &&
            const DeepCollectionEquality()
                .equals(other._southIndianMovielist, _southIndianMovielist) &&
            const DeepCollectionEquality()
                .equals(other._trndingTvList, _trndingTvList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.stateId, stateId) || other.stateId == stateId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pastYearListMovies),
      const DeepCollectionEquality().hash(_trendingMovielist),
      const DeepCollectionEquality().hash(_tensDramamovieList),
      const DeepCollectionEquality().hash(_southIndianMovielist),
      const DeepCollectionEquality().hash(_trndingTvList),
      isLoading,
      hasError,
      stateId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements HomeState {
  const factory _Initial(
      {required final List<HotAndNewData> pastYearListMovies,
      required final List<HotAndNewData> trendingMovielist,
      required final List<HotAndNewData> tensDramamovieList,
      required final List<HotAndNewData> southIndianMovielist,
      required final List<HotAndNewData> trndingTvList,
      required final bool isLoading,
      required final bool hasError,
      required final String stateId}) = _$_Initial;

  @override
  List<HotAndNewData> get pastYearListMovies;
  @override
  List<HotAndNewData> get trendingMovielist;
  @override
  List<HotAndNewData> get tensDramamovieList;
  @override
  List<HotAndNewData> get southIndianMovielist;
  @override
  List<HotAndNewData> get trndingTvList;
  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  String get stateId;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
