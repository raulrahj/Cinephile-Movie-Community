import 'package:dartz/dartz.dart';
import 'package:open_box/data/models/user/m_login.dart';
import 'package:open_box/data/models/user/m_profile.dart';

abstract class AuthRepo {
 Future<Either<String, bool>>  signUp({required UserResp signUpData});
  Future<Either<String, ProfileModel?>> loginUser(
      {required LoginModel loginData});
}
