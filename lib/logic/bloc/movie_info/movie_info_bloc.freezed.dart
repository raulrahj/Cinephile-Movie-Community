// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movie_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MovieInfoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getTrending,
    required TResult Function() getNewReleased,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getTrending,
    TResult Function()? getNewReleased,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getTrending,
    TResult Function()? getNewReleased,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTrending value) getTrending,
    required TResult Function(_GetNewReleased value) getNewReleased,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetTrending value)? getTrending,
    TResult Function(_GetNewReleased value)? getNewReleased,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTrending value)? getTrending,
    TResult Function(_GetNewReleased value)? getNewReleased,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieInfoEventCopyWith<$Res> {
  factory $MovieInfoEventCopyWith(
          MovieInfoEvent value, $Res Function(MovieInfoEvent) then) =
      _$MovieInfoEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$MovieInfoEventCopyWithImpl<$Res>
    implements $MovieInfoEventCopyWith<$Res> {
  _$MovieInfoEventCopyWithImpl(this._value, this._then);

  final MovieInfoEvent _value;
  // ignore: unused_field
  final $Res Function(MovieInfoEvent) _then;
}

/// @nodoc
abstract class _$$_GetTrendingCopyWith<$Res> {
  factory _$$_GetTrendingCopyWith(
          _$_GetTrending value, $Res Function(_$_GetTrending) then) =
      __$$_GetTrendingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetTrendingCopyWithImpl<$Res>
    extends _$MovieInfoEventCopyWithImpl<$Res>
    implements _$$_GetTrendingCopyWith<$Res> {
  __$$_GetTrendingCopyWithImpl(
      _$_GetTrending _value, $Res Function(_$_GetTrending) _then)
      : super(_value, (v) => _then(v as _$_GetTrending));

  @override
  _$_GetTrending get _value => super._value as _$_GetTrending;
}

/// @nodoc

class _$_GetTrending implements _GetTrending {
  const _$_GetTrending();

  @override
  String toString() {
    return 'MovieInfoEvent.getTrending()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetTrending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getTrending,
    required TResult Function() getNewReleased,
  }) {
    return getTrending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getTrending,
    TResult Function()? getNewReleased,
  }) {
    return getTrending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getTrending,
    TResult Function()? getNewReleased,
    required TResult orElse(),
  }) {
    if (getTrending != null) {
      return getTrending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTrending value) getTrending,
    required TResult Function(_GetNewReleased value) getNewReleased,
  }) {
    return getTrending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetTrending value)? getTrending,
    TResult Function(_GetNewReleased value)? getNewReleased,
  }) {
    return getTrending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTrending value)? getTrending,
    TResult Function(_GetNewReleased value)? getNewReleased,
    required TResult orElse(),
  }) {
    if (getTrending != null) {
      return getTrending(this);
    }
    return orElse();
  }
}

abstract class _GetTrending implements MovieInfoEvent {
  const factory _GetTrending() = _$_GetTrending;
}

/// @nodoc
abstract class _$$_GetNewReleasedCopyWith<$Res> {
  factory _$$_GetNewReleasedCopyWith(
          _$_GetNewReleased value, $Res Function(_$_GetNewReleased) then) =
      __$$_GetNewReleasedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetNewReleasedCopyWithImpl<$Res>
    extends _$MovieInfoEventCopyWithImpl<$Res>
    implements _$$_GetNewReleasedCopyWith<$Res> {
  __$$_GetNewReleasedCopyWithImpl(
      _$_GetNewReleased _value, $Res Function(_$_GetNewReleased) _then)
      : super(_value, (v) => _then(v as _$_GetNewReleased));

  @override
  _$_GetNewReleased get _value => super._value as _$_GetNewReleased;
}

/// @nodoc

class _$_GetNewReleased implements _GetNewReleased {
  const _$_GetNewReleased();

  @override
  String toString() {
    return 'MovieInfoEvent.getNewReleased()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetNewReleased);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getTrending,
    required TResult Function() getNewReleased,
  }) {
    return getNewReleased();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getTrending,
    TResult Function()? getNewReleased,
  }) {
    return getNewReleased?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getTrending,
    TResult Function()? getNewReleased,
    required TResult orElse(),
  }) {
    if (getNewReleased != null) {
      return getNewReleased();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTrending value) getTrending,
    required TResult Function(_GetNewReleased value) getNewReleased,
  }) {
    return getNewReleased(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetTrending value)? getTrending,
    TResult Function(_GetNewReleased value)? getNewReleased,
  }) {
    return getNewReleased?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTrending value)? getTrending,
    TResult Function(_GetNewReleased value)? getNewReleased,
    required TResult orElse(),
  }) {
    if (getNewReleased != null) {
      return getNewReleased(this);
    }
    return orElse();
  }
}

abstract class _GetNewReleased implements MovieInfoEvent {
  const factory _GetNewReleased() = _$_GetNewReleased;
}

/// @nodoc
mixin _$MovieInfoState {
  bool get isLoading => throw _privateConstructorUsedError;
  Trending? get trendingData => throw _privateConstructorUsedError;
  NewReleases? get newReleaseData => throw _privateConstructorUsedError;
  Option<Either<MainFailure, Trending>> get trendingFSOption =>
      throw _privateConstructorUsedError;
  Option<Either<MainFailure, NewReleases>> get newReleaseOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieInfoStateCopyWith<MovieInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieInfoStateCopyWith<$Res> {
  factory $MovieInfoStateCopyWith(
          MovieInfoState value, $Res Function(MovieInfoState) then) =
      _$MovieInfoStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      Trending? trendingData,
      NewReleases? newReleaseData,
      Option<Either<MainFailure, Trending>> trendingFSOption,
      Option<Either<MainFailure, NewReleases>> newReleaseOption});
}

/// @nodoc
class _$MovieInfoStateCopyWithImpl<$Res>
    implements $MovieInfoStateCopyWith<$Res> {
  _$MovieInfoStateCopyWithImpl(this._value, this._then);

  final MovieInfoState _value;
  // ignore: unused_field
  final $Res Function(MovieInfoState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? trendingData = freezed,
    Object? newReleaseData = freezed,
    Object? trendingFSOption = freezed,
    Object? newReleaseOption = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      trendingData: trendingData == freezed
          ? _value.trendingData
          : trendingData // ignore: cast_nullable_to_non_nullable
              as Trending?,
      newReleaseData: newReleaseData == freezed
          ? _value.newReleaseData
          : newReleaseData // ignore: cast_nullable_to_non_nullable
              as NewReleases?,
      trendingFSOption: trendingFSOption == freezed
          ? _value.trendingFSOption
          : trendingFSOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, Trending>>,
      newReleaseOption: newReleaseOption == freezed
          ? _value.newReleaseOption
          : newReleaseOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, NewReleases>>,
    ));
  }
}

/// @nodoc
abstract class _$$_MovieInfoStateCopyWith<$Res>
    implements $MovieInfoStateCopyWith<$Res> {
  factory _$$_MovieInfoStateCopyWith(
          _$_MovieInfoState value, $Res Function(_$_MovieInfoState) then) =
      __$$_MovieInfoStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      Trending? trendingData,
      NewReleases? newReleaseData,
      Option<Either<MainFailure, Trending>> trendingFSOption,
      Option<Either<MainFailure, NewReleases>> newReleaseOption});
}

/// @nodoc
class __$$_MovieInfoStateCopyWithImpl<$Res>
    extends _$MovieInfoStateCopyWithImpl<$Res>
    implements _$$_MovieInfoStateCopyWith<$Res> {
  __$$_MovieInfoStateCopyWithImpl(
      _$_MovieInfoState _value, $Res Function(_$_MovieInfoState) _then)
      : super(_value, (v) => _then(v as _$_MovieInfoState));

  @override
  _$_MovieInfoState get _value => super._value as _$_MovieInfoState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? trendingData = freezed,
    Object? newReleaseData = freezed,
    Object? trendingFSOption = freezed,
    Object? newReleaseOption = freezed,
  }) {
    return _then(_$_MovieInfoState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      trendingData: trendingData == freezed
          ? _value.trendingData
          : trendingData // ignore: cast_nullable_to_non_nullable
              as Trending?,
      newReleaseData: newReleaseData == freezed
          ? _value.newReleaseData
          : newReleaseData // ignore: cast_nullable_to_non_nullable
              as NewReleases?,
      trendingFSOption: trendingFSOption == freezed
          ? _value.trendingFSOption
          : trendingFSOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, Trending>>,
      newReleaseOption: newReleaseOption == freezed
          ? _value.newReleaseOption
          : newReleaseOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, NewReleases>>,
    ));
  }
}

/// @nodoc

class _$_MovieInfoState implements _MovieInfoState {
  const _$_MovieInfoState(
      {required this.isLoading,
      this.trendingData,
      this.newReleaseData,
      required this.trendingFSOption,
      required this.newReleaseOption});

  @override
  final bool isLoading;
  @override
  final Trending? trendingData;
  @override
  final NewReleases? newReleaseData;
  @override
  final Option<Either<MainFailure, Trending>> trendingFSOption;
  @override
  final Option<Either<MainFailure, NewReleases>> newReleaseOption;

  @override
  String toString() {
    return 'MovieInfoState(isLoading: $isLoading, trendingData: $trendingData, newReleaseData: $newReleaseData, trendingFSOption: $trendingFSOption, newReleaseOption: $newReleaseOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieInfoState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.trendingData, trendingData) &&
            const DeepCollectionEquality()
                .equals(other.newReleaseData, newReleaseData) &&
            const DeepCollectionEquality()
                .equals(other.trendingFSOption, trendingFSOption) &&
            const DeepCollectionEquality()
                .equals(other.newReleaseOption, newReleaseOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(trendingData),
      const DeepCollectionEquality().hash(newReleaseData),
      const DeepCollectionEquality().hash(trendingFSOption),
      const DeepCollectionEquality().hash(newReleaseOption));

  @JsonKey(ignore: true)
  @override
  _$$_MovieInfoStateCopyWith<_$_MovieInfoState> get copyWith =>
      __$$_MovieInfoStateCopyWithImpl<_$_MovieInfoState>(this, _$identity);
}

abstract class _MovieInfoState implements MovieInfoState {
  const factory _MovieInfoState(
      {required final bool isLoading,
      final Trending? trendingData,
      final NewReleases? newReleaseData,
      required final Option<Either<MainFailure, Trending>> trendingFSOption,
      required final Option<Either<MainFailure, NewReleases>>
          newReleaseOption}) = _$_MovieInfoState;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  Trending? get trendingData => throw _privateConstructorUsedError;
  @override
  NewReleases? get newReleaseData => throw _privateConstructorUsedError;
  @override
  Option<Either<MainFailure, Trending>> get trendingFSOption =>
      throw _privateConstructorUsedError;
  @override
  Option<Either<MainFailure, NewReleases>> get newReleaseOption =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MovieInfoStateCopyWith<_$_MovieInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}
