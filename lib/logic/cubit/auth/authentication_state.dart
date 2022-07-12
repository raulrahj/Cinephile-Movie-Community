part of 'authentication_cubit.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  factory AuthenticationState(
      {required bool isLoading,
      ProfileModel? signUpData,
      ProfileModel? loginData}) = _AuthenticationState;
  factory AuthenticationState.initial() => AuthenticationState(
        isLoading: false,
        signUpData: ProfileModel(
          token: '',
          user: UserResp(username: '', firstname: '', lastname: ''),
        ),
        loginData: ProfileModel(
          token: '',
          user: UserResp(username: '', firstname: '', lastname: ''),
        ),
      );
}
