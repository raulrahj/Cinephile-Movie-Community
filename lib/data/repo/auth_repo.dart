import 'package:open_box/data/models/user/m_login.dart';
import 'package:open_box/data/models/user/m_profile.dart';

abstract class AuthRepo {
  Future<ProfileModel?> signUp({required UserResp signUpData});
  Future<ProfileModel?> loginUser({required LoginModel loginData});
}
