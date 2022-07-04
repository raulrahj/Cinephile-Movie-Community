import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:open_box/data/models/user/m_login.dart';
import 'package:open_box/data/models/user/m_user.dart';

class Register {
  final dio = Dio(BaseOptions(baseUrl: 'localhost:5000'));

  Future<UserData?> signUp({required UserData signUpData}) async {
    UserData? retrievedUser;
    final data = signUpData.toJson();
    
    try {
      // Response response = await dio.post(
      //   // 'http://localhost:5000/auth/register',
      //   'http://192.168.1.105:5000/auth/register',

      //   data: jsonEncode(data),
      // var url = Uri.parse('http://localhost:3000/auth/register');

      var url = Uri.parse('http://192.168.1.102:5000/auth/register/');
var response = await http.post(url, body: jsonEncode(data));
      if (response.statusCode == 200 || response.statusCode == 201) {
        retrievedUser = UserData.fromJson(response.headers);
        print('user registered');
      }
    } on DioError catch (e) {
      print(e);
    } catch (e) {
      log(e.toString());
    }
    return retrievedUser;
  }

  Future<UserData?> loginUser({required LoginModel loginData}) async {
    UserData? retrievedUser;
    final data = loginData.toJson();
    try {
      Response response = await dio.post(
        // 'https://localhost:5000/auth/login',

        'http://192.168.1.105:5000/auth/login',
        data: jsonEncode(data),
        // options: Options(headers: {
        //   HttpHeaders.contentTypeHeader: "application/json",
        // }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        retrievedUser = UserData.fromJson(response.data);
        print('login success');
        log(retrievedUser.toString());
      } else {
        print(response.statusMessage);
      }
    } on DioError catch (e) {
      print(e);
    } catch (e) {
      log(e.toString());
    }
    return retrievedUser;
  }
}
