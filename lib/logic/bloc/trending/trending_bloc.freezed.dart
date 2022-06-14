// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'trending_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TrendingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getTrending,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getTrending,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getTrending,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTrending value) getTrending,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetTrending value)? getTrending,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTrending value)? getTrending,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrendingEventCopyWith<$Res> {
  factory $TrendingEventCopyWith(
          TrendingEvent value, $Res Function(TrendingEvent) then) =
      _$TrendingEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$TrendingEventCopyWithImpl<$Res>
    implements $TrendingEventCopyWith<$Res> {
  _$TrendingEventCopyWithImpl(this._value, this._then);

  final TrendingEvent _value;
  // ignore: unused_field
  final $Res Function(TrendingEvent) _then;
}

/// @nodoc
abstract class _$$_GetTrendingCopyWith<$Res> {
  factory _$$_GetTrendingCopyWith(
          _$_GetTrending value, $Res Function(_$_GetTrending) then) =
      __$$_GetTrendingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetTrendingCopyWithImpl<$Res>
    extends _$TrendingEventCopyWithImpl<$Res>
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
    return 'TrendingEvent.getTrending()';
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
  }) {
    return getTrending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getTrending,
  }) {
    return getTrending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getTrending,
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
  }) {
    return getTrending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetTrending value)? getTrending,
  }) {
    return getTrending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTrending value)? getTrending,
    required TResult orElse(),
  }) {
    if (getTrending != null) {
      return getTrending(this);
    }
    return orElse();
  }
}

abstract class _GetTrending implements TrendingEvent {
  const factory _GetTrending() = _$_GetTrending;
}

/// @nodoc
mixin _$TrendingState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Trending>? get trendingData => throw _privateConstructorUsedError;
  Option<Either<MainFailure, List<Trending>>> get trendingFSOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrendingStateCopyWith<TrendingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrendingStateCopyWith<$Res> {
  factory $TrendingStateCopyWith(
          TrendingState value, $Res Function(TrendingState) then) =
      _$TrendingStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      List<Trending>? trendingData,
      Option<Either<MainFailure, List<Trending>>> trendingFSOption});
}

/// @nodoc
class _$TrendingStateCopyWithImpl<$Res>
    implements $TrendingStateCopyWith<$Res> {
  _$TrendingStateCopyWithImpl(this._value, this._then);

  final TrendingState _value;
  // ignore: unused_field
  final $Res Function(TrendingState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? trendingData = freezed,
    Object? trendingFSOption = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      trendingData: trendingData == freezed
          ? _value.trendingData
          : trendingData // ignore: cast_nullable_to_non_nullable
              as List<Trending>?,
      trendingFSOption: trendingFSOption == freezed
          ? _value.trendingFSOption
          : trendingFSOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<Trending>>>,
    ));
  }
}

/// @nodoc
abstract class _$$_TrendingStateCopyWith<$Res>
    implements $TrendingStateCopyWith<$Res> {
  factory _$$_TrendingStateCopyWith(
          _$_TrendingState value, $Res Function(_$_TrendingState) then) =
      __$$_TrendingStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      List<Trending>? trendingData,
      Option<Either<MainFailure, List<Trending>>> trendingFSOption});
}

/// @nodoc
class __$$_TrendingStateCopyWithImpl<$Res>
    extends _$TrendingStateCopyWithImpl<$Res>
    implements _$$_TrendingStateCopyWith<$Res> {
  __$$_TrendingStateCopyWithImpl(
      _$_TrendingState _value, $Res Function(_$_TrendingState) _then)
      : super(_value, (v) => _then(v as _$_TrendingState));

  @override
  _$_TrendingState get _value => super._value as _$_TrendingState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? trendingData = freezed,
    Object? trendingFSOption = freezed,
  }) {
    return _then(_$_TrendingState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      trendingData: trendingData == freezed
          ? _value._trendingData
          : trendingData // ignore: cast_nullable_to_non_nullable
              as List<Trending>?,
      trendingFSOption: trendingFSOption == freezed
          ? _value.trendingFSOption
          : trendingFSOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<Trending>>>,
    ));
  }
}

/// @nodoc

class _$_TrendingState implements _TrendingState {
  const _$_TrendingState(
      {required this.isLoading,
      final List<Trending>? trendingData,
      required this.trendingFSOption})
      : _trendingData = trendingData;

  @override
  final bool isLoading;
  final List<Trending>? _trendingData;
  @override
  List<Trending>? get trendingData {
    final value = _trendingData;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Option<Either<MainFailure, List<Trending>>> trendingFSOption;

  @override
  String toString() {
    return 'TrendingState(isLoading: $isLoading, trendingData: $trendingData, trendingFSOption: $trendingFSOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrendingState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other._trendingData, _trendingData) &&
            const DeepCollectionEquality()
                .equals(other.trendingFSOption, trendingFSOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(_trendingData),
      const DeepCollectionEquality().hash(trendingFSOption));

  @JsonKey(ignore: true)
  @override
  _$$_TrendingStateCopyWith<_$_TrendingState> get copyWith =>
      __$$_TrendingStateCopyWithImpl<_$_TrendingState>(this, _$identity);
}

abstract class _TrendingState implements TrendingState {
  const factory _TrendingState(
      {required final bool isLoading,
      final List<Trending>? trendingData,
      required final Option<Either<MainFailure, List<Trending>>>
          trendingFSOption}) = _$_TrendingState;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  List<Trending>? get trendingData => throw _privateConstructorUsedError;
  @override
  Option<Either<MainFailure, List<Trending>>> get trendingFSOption =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TrendingStateCopyWith<_$_TrendingState> get copyWith =>
      throw _privateConstructorUsedError;
}
