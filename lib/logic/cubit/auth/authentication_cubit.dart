// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
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

  Future signUp({required UserResp signUpData}) async {
    emit(state.copyWith(isLoading: true, isLoginSuccess: false));
    final Either<String, bool> signupResp =
        await _authRepo.signUp(signUpData: signUpData);
        // ignore: avoid_print
        print(signupResp);
    emit(signupResp.fold(
        (left) => state.copyWith(
            isLoading: false,
            isLoginSuccess: false,
            isError: true,
            errorText: left,
            authFSOption: Some(Left(left))),
        (right) => state.copyWith(
            isLoading: false,
            isError: false,
            isLoginSuccess: right,
            signupFSOption: Some(Right(right)))));
    // return null;
  }

  Future login({required LoginModel loginData}) async {
    emit(state.copyWith(isLoading: true));
    final Either<String, ProfileModel?> loginResp =
        await _authRepo.loginUser(loginData: loginData);
    emit(loginResp.fold(
        (left) => state.copyWith(
            isLoading: false,
            isError: true,
            errorText: left,
            authFSOption: Some(Left(left))),
        (right) => state.copyWith(
            isLoading: false,
            isError: false,
            authFSOption: Some(Right(right!)))));
  }
}
