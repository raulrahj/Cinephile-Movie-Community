// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:open_box/data/models/user/m_login.dart';
import 'package:open_box/data/models/user/m_profile.dart';
import 'package:open_box/data/repo/auth_repo.dart';

part 'authentication_state.dart';
part 'authentication_cubit.freezed.dart';

@injectable
class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthRepo _authRepo;
  AuthenticationCubit(this._authRepo) : super(AuthenticationState.initial());

  Future<ProfileModel?> signUp({required UserResp signUpData}) async {
    emit(state.copyWith(isLoading: true));
    final signupResp = await _authRepo.signUp(signUpData: signUpData);
    if (signupResp != null) {
      emit(state.copyWith(isLoading: false, signUpData: signupResp));
    }
    return null;
  }

  Future<ProfileModel?> login({required LoginModel loginData}) async {
    emit(state.copyWith(isLoading: true));
    final loginResp = await _authRepo.loginUser(loginData: loginData);
    if (loginResp != null) {
      emit(state.copyWith(isLoading: false, loginData: loginResp));
    }
    return null;
  }
}
