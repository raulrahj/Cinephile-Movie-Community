// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'new_releases_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewReleasesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getNewReleased,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getNewReleased,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getNewReleased,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNewReleased value) getNewReleased,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetNewReleased value)? getNewReleased,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNewReleased value)? getNewReleased,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewReleasesEventCopyWith<$Res> {
  factory $NewReleasesEventCopyWith(
          NewReleasesEvent value, $Res Function(NewReleasesEvent) then) =
      _$NewReleasesEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$NewReleasesEventCopyWithImpl<$Res>
    implements $NewReleasesEventCopyWith<$Res> {
  _$NewReleasesEventCopyWithImpl(this._value, this._then);

  final NewReleasesEvent _value;
  // ignore: unused_field
  final $Res Function(NewReleasesEvent) _then;
}

/// @nodoc
abstract class _$$_GetNewReleasedCopyWith<$Res> {
  factory _$$_GetNewReleasedCopyWith(
          _$_GetNewReleased value, $Res Function(_$_GetNewReleased) then) =
      __$$_GetNewReleasedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetNewReleasedCopyWithImpl<$Res>
    extends _$NewReleasesEventCopyWithImpl<$Res>
    implements _$$_GetNewReleasedCopyWith<$Res> {
  __$$_GetNewReleasedCopyWithImpl(
      _$_GetNewReleased _value, $Res Function(_$_GetNewReleased) _then)
      : super(_value, (v) => _then(v as _$_GetNewReleased));

  @override
  _$_GetNewReleased get _value => super._value as _$_GetNewReleased;
}

/// @nodoc

class _$_GetNewReleased
    with DiagnosticableTreeMixin
    implements _GetNewReleased {
  const _$_GetNewReleased();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NewReleasesEvent.getNewReleased()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'NewReleasesEvent.getNewReleased'));
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
    required TResult Function() getNewReleased,
  }) {
    return getNewReleased();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getNewReleased,
  }) {
    return getNewReleased?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
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
    required TResult Function(_GetNewReleased value) getNewReleased,
  }) {
    return getNewReleased(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetNewReleased value)? getNewReleased,
  }) {
    return getNewReleased?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNewReleased value)? getNewReleased,
    required TResult orElse(),
  }) {
    if (getNewReleased != null) {
      return getNewReleased(this);
    }
    return orElse();
  }
}

abstract class _GetNewReleased implements NewReleasesEvent {
  const factory _GetNewReleased() = _$_GetNewReleased;
}

/// @nodoc
mixin _$NewReleasesState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<NewReleaseResults>? get newReleaseData =>
      throw _privateConstructorUsedError;
  Option<Either<MainFailure, List<NewReleaseResults>>> get newReleaseOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewReleasesStateCopyWith<NewReleasesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewReleasesStateCopyWith<$Res> {
  factory $NewReleasesStateCopyWith(
          NewReleasesState value, $Res Function(NewReleasesState) then) =
      _$NewReleasesStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      List<NewReleaseResults>? newReleaseData,
      Option<Either<MainFailure, List<NewReleaseResults>>> newReleaseOption});
}

/// @nodoc
class _$NewReleasesStateCopyWithImpl<$Res>
    implements $NewReleasesStateCopyWith<$Res> {
  _$NewReleasesStateCopyWithImpl(this._value, this._then);

  final NewReleasesState _value;
  // ignore: unused_field
  final $Res Function(NewReleasesState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? newReleaseData = freezed,
    Object? newReleaseOption = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      newReleaseData: newReleaseData == freezed
          ? _value.newReleaseData
          : newReleaseData // ignore: cast_nullable_to_non_nullable
              as List<NewReleaseResults>?,
      newReleaseOption: newReleaseOption == freezed
          ? _value.newReleaseOption
          : newReleaseOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<NewReleaseResults>>>,
    ));
  }
}

/// @nodoc
abstract class _$$_NewReleaseStateCopyWith<$Res>
    implements $NewReleasesStateCopyWith<$Res> {
  factory _$$_NewReleaseStateCopyWith(
          _$_NewReleaseState value, $Res Function(_$_NewReleaseState) then) =
      __$$_NewReleaseStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      List<NewReleaseResults>? newReleaseData,
      Option<Either<MainFailure, List<NewReleaseResults>>> newReleaseOption});
}

/// @nodoc
class __$$_NewReleaseStateCopyWithImpl<$Res>
    extends _$NewReleasesStateCopyWithImpl<$Res>
    implements _$$_NewReleaseStateCopyWith<$Res> {
  __$$_NewReleaseStateCopyWithImpl(
      _$_NewReleaseState _value, $Res Function(_$_NewReleaseState) _then)
      : super(_value, (v) => _then(v as _$_NewReleaseState));

  @override
  _$_NewReleaseState get _value => super._value as _$_NewReleaseState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? newReleaseData = freezed,
    Object? newReleaseOption = freezed,
  }) {
    return _then(_$_NewReleaseState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      newReleaseData: newReleaseData == freezed
          ? _value._newReleaseData
          : newReleaseData // ignore: cast_nullable_to_non_nullable
              as List<NewReleaseResults>?,
      newReleaseOption: newReleaseOption == freezed
          ? _value.newReleaseOption
          : newReleaseOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<NewReleaseResults>>>,
    ));
  }
}

/// @nodoc

class _$_NewReleaseState
    with DiagnosticableTreeMixin
    implements _NewReleaseState {
  const _$_NewReleaseState(
      {required this.isLoading,
      final List<NewReleaseResults>? newReleaseData,
      required this.newReleaseOption})
      : _newReleaseData = newReleaseData;

  @override
  final bool isLoading;
  final List<NewReleaseResults>? _newReleaseData;
  @override
  List<NewReleaseResults>? get newReleaseData {
    final value = _newReleaseData;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Option<Either<MainFailure, List<NewReleaseResults>>> newReleaseOption;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NewReleasesState(isLoading: $isLoading, newReleaseData: $newReleaseData, newReleaseOption: $newReleaseOption)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NewReleasesState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('newReleaseData', newReleaseData))
      ..add(DiagnosticsProperty('newReleaseOption', newReleaseOption));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewReleaseState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other._newReleaseData, _newReleaseData) &&
            const DeepCollectionEquality()
                .equals(other.newReleaseOption, newReleaseOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(_newReleaseData),
      const DeepCollectionEquality().hash(newReleaseOption));

  @JsonKey(ignore: true)
  @override
  _$$_NewReleaseStateCopyWith<_$_NewReleaseState> get copyWith =>
      __$$_NewReleaseStateCopyWithImpl<_$_NewReleaseState>(this, _$identity);
}

abstract class _NewReleaseState implements NewReleasesState {
  const factory _NewReleaseState(
      {required final bool isLoading,
      final List<NewReleaseResults>? newReleaseData,
      required final Option<Either<MainFailure, List<NewReleaseResults>>>
          newReleaseOption}) = _$_NewReleaseState;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  List<NewReleaseResults>? get newReleaseData =>
      throw _privateConstructorUsedError;
  @override
  Option<Either<MainFailure, List<NewReleaseResults>>> get newReleaseOption =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NewReleaseStateCopyWith<_$_NewReleaseState> get copyWith =>
      throw _privateConstructorUsedError;
}
