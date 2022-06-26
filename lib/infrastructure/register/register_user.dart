import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:open_box/data/models/user/m_user.dart';

class Register {
  final dio = Dio(BaseOptions(baseUrl: 'localhost:5000'));

  Future<UserData?> signUp({required UserData signUpData}) async {
    UserData? retrievedUser;
    try {
      Response response =
          await dio.post('localhost:5000/auth/register/', data: signUpData.toJson());
      retrievedUser = UserData.fromJson(response.data);
      print('user registered');
    } catch (e) {
      log(e.toString());
    }
    return retrievedUser;
  }

  Future<UserData?> loginUser({required UserData loginData}) async {
    UserData? retrievedUser;
    try {
      Response response =
          await dio.post('/auth/login', data: loginData.toJson());
      retrievedUser = UserData.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    return retrievedUser;
  }
}
