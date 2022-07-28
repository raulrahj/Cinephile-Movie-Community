part of 'authentication_cubit.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  factory AuthenticationState({
    required bool isLoading,
    required ProfileModel signUpData,
    required ProfileModel loginData,
    required String errorText,
    required bool isError,
    required bool isLoginSuccess,
    required Option<Either<String, ProfileModel>> authFSOption,
    required Option<Either<String, bool>> signupFSOption,
  }) = _AuthenticationState;
  factory AuthenticationState.initial() => AuthenticationState(
      isLoading: false,
      signUpData: ProfileModel(
        token: '',
        user: UserResp(username: '', firstname: '', lastname: ''),
      ),
      errorText: '',
      isError: false,
      loginData: ProfileModel(
        token: '',
        user: UserResp(username: '', firstname: '', lastname: ''),
      ),
      isLoginSuccess: false,
      authFSOption: const None(),
      signupFSOption: const None());
}
