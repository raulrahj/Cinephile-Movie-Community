// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authentication_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticationState {
  bool get isLoading => throw _privateConstructorUsedError;
  ProfileModel get signUpData => throw _privateConstructorUsedError;
  ProfileModel get loginData => throw _privateConstructorUsedError;
  String get errorText => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  bool get isLoginSuccess => throw _privateConstructorUsedError;
  Option<Either<String, ProfileModel>> get authFSOption =>
      throw _privateConstructorUsedError;
  Option<Either<String, bool>> get signupFSOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthenticationStateCopyWith<AuthenticationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      ProfileModel signUpData,
      ProfileModel loginData,
      String errorText,
      bool isError,
      bool isLoginSuccess,
      Option<Either<String, ProfileModel>> authFSOption,
      Option<Either<String, bool>> signupFSOption});
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  final AuthenticationState _value;
  // ignore: unused_field
  final $Res Function(AuthenticationState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? signUpData = freezed,
    Object? loginData = freezed,
    Object? errorText = freezed,
    Object? isError = freezed,
    Object? isLoginSuccess = freezed,
    Object? authFSOption = freezed,
    Object? signupFSOption = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      signUpData: signUpData == freezed
          ? _value.signUpData
          : signUpData // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
      loginData: loginData == freezed
          ? _value.loginData
          : loginData // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
      errorText: errorText == freezed
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginSuccess: isLoginSuccess == freezed
          ? _value.isLoginSuccess
          : isLoginSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      authFSOption: authFSOption == freezed
          ? _value.authFSOption
          : authFSOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<String, ProfileModel>>,
      signupFSOption: signupFSOption == freezed
          ? _value.signupFSOption
          : signupFSOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<String, bool>>,
    ));
  }
}

/// @nodoc
abstract class _$$_AuthenticationStateCopyWith<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  factory _$$_AuthenticationStateCopyWith(_$_AuthenticationState value,
          $Res Function(_$_AuthenticationState) then) =
      __$$_AuthenticationStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      ProfileModel signUpData,
      ProfileModel loginData,
      String errorText,
      bool isError,
      bool isLoginSuccess,
      Option<Either<String, ProfileModel>> authFSOption,
      Option<Either<String, bool>> signupFSOption});
}

/// @nodoc
class __$$_AuthenticationStateCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$_AuthenticationStateCopyWith<$Res> {
  __$$_AuthenticationStateCopyWithImpl(_$_AuthenticationState _value,
      $Res Function(_$_AuthenticationState) _then)
      : super(_value, (v) => _then(v as _$_AuthenticationState));

  @override
  _$_AuthenticationState get _value => super._value as _$_AuthenticationState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? signUpData = freezed,
    Object? loginData = freezed,
    Object? errorText = freezed,
    Object? isError = freezed,
    Object? isLoginSuccess = freezed,
    Object? authFSOption = freezed,
    Object? signupFSOption = freezed,
  }) {
    return _then(_$_AuthenticationState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      signUpData: signUpData == freezed
          ? _value.signUpData
          : signUpData // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
      loginData: loginData == freezed
          ? _value.loginData
          : loginData // ignore: cast_nullable_to_non_nullable
              as ProfileModel,
      errorText: errorText == freezed
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginSuccess: isLoginSuccess == freezed
          ? _value.isLoginSuccess
          : isLoginSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      authFSOption: authFSOption == freezed
          ? _value.authFSOption
          : authFSOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<String, ProfileModel>>,
      signupFSOption: signupFSOption == freezed
          ? _value.signupFSOption
          : signupFSOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<String, bool>>,
    ));
  }
}

/// @nodoc

class _$_AuthenticationState implements _AuthenticationState {
  _$_AuthenticationState(
      {required this.isLoading,
      required this.signUpData,
      required this.loginData,
      required this.errorText,
      required this.isError,
      required this.isLoginSuccess,
      required this.authFSOption,
      required this.signupFSOption});

  @override
  final bool isLoading;
  @override
  final ProfileModel signUpData;
  @override
  final ProfileModel loginData;
  @override
  final String errorText;
  @override
  final bool isError;
  @override
  final bool isLoginSuccess;
  @override
  final Option<Either<String, ProfileModel>> authFSOption;
  @override
  final Option<Either<String, bool>> signupFSOption;

  @override
  String toString() {
    return 'AuthenticationState(isLoading: $isLoading, signUpData: $signUpData, loginData: $loginData, errorText: $errorText, isError: $isError, isLoginSuccess: $isLoginSuccess, authFSOption: $authFSOption, signupFSOption: $signupFSOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticationState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.signUpData, signUpData) &&
            const DeepCollectionEquality().equals(other.loginData, loginData) &&
            const DeepCollectionEquality().equals(other.errorText, errorText) &&
            const DeepCollectionEquality().equals(other.isError, isError) &&
            const DeepCollectionEquality()
                .equals(other.isLoginSuccess, isLoginSuccess) &&
            const DeepCollectionEquality()
                .equals(other.authFSOption, authFSOption) &&
            const DeepCollectionEquality()
                .equals(other.signupFSOption, signupFSOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(signUpData),
      const DeepCollectionEquality().hash(loginData),
      const DeepCollectionEquality().hash(errorText),
      const DeepCollectionEquality().hash(isError),
      const DeepCollectionEquality().hash(isLoginSuccess),
      const DeepCollectionEquality().hash(authFSOption),
      const DeepCollectionEquality().hash(signupFSOption));

  @JsonKey(ignore: true)
  @override
  _$$_AuthenticationStateCopyWith<_$_AuthenticationState> get copyWith =>
      __$$_AuthenticationStateCopyWithImpl<_$_AuthenticationState>(
          this, _$identity);
}

abstract class _AuthenticationState implements AuthenticationState {
  factory _AuthenticationState(
          {required final bool isLoading,
          required final ProfileModel signUpData,
          required final ProfileModel loginData,
          required final String errorText,
          required final bool isError,
          required final bool isLoginSuccess,
          required final Option<Either<String, ProfileModel>> authFSOption,
          required final Option<Either<String, bool>> signupFSOption}) =
      _$_AuthenticationState;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  ProfileModel get signUpData => throw _privateConstructorUsedError;
  @override
  ProfileModel get loginData => throw _privateConstructorUsedError;
  @override
  String get errorText => throw _privateConstructorUsedError;
  @override
  bool get isError => throw _privateConstructorUsedError;
  @override
  bool get isLoginSuccess => throw _privateConstructorUsedError;
  @override
  Option<Either<String, ProfileModel>> get authFSOption =>
      throw _privateConstructorUsedError;
  @override
  Option<Either<String, bool>> get signupFSOption =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AuthenticationStateCopyWith<_$_AuthenticationState> get copyWith =>
      throw _privateConstructorUsedError;
}
