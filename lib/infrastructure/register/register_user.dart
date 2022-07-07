import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:open_box/data/models/user/m_login.dart';
import 'package:open_box/data/models/user/m_profile.dart';
import 'package:open_box/data/models/user/m_profile.dart';
import 'package:open_box/infrastructure/helper/shared_service.dart';

class Register {
  final dio = Dio(BaseOptions(baseUrl: 'localhost:5000'))
    ..interceptors.add(Signup());

  Future<ProfileModel?> signUp({required UserResp signUpData}) async {
    ProfileModel? retrievedUser;
    final data = {
      "username": signUpData.username,
      "firstname": signUpData.firstname,
      "lastname": signUpData.lastname,
      "password": signUpData.password
    };

    try {
      Response response = await dio.post(
   
        '$authBaseUrl/register',
        data: jsonEncode(data),
        onSendProgress: (int r, int l) async {
          log('Request Sign up !!!!');
        },
      ).whenComplete(
        () {
          log('Sign Up Request Completed !!!');
        },
      ).catchError(
        (e) {
          // log(e.toString());
          throw (e);
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        retrievedUser = ProfileModel.fromJson(response.data);
        log('user registered');
      } else if (response.statusCode == 400) {
        print('On sign up Request ${response.statusMessage}');
      } else if (response.statusCode! >= 500) {
        print('internal error');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.statusMessage);
        if (e.response!.statusCode == 400) {
          print(e.response!.statusMessage);
        }
      }
      throw e.error;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
    return retrievedUser;
  }

  static const authBaseUrl = 'http://192.168.43.244:5000/auth';
  static const loginUrl = 'http://127.0.0.1:5000/auth/login';
  static const loginUrl2 = 'http/://localhost:5000/auth/login';
  static const loginUrl1 = 'http://192.168.43.244:5000/auth/login';

  Future<ProfileModel?> loginUser({required LoginModel loginData}) async {
    ProfileModel? retrievedUser;
    final data = loginData.toJson();
    try {
      Response response = await dio.post(
        loginUrl1,
        data: jsonEncode(data),
        onSendProgress: (int r, int l) async {
          log('Request Login !!!');
        },
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      ).whenComplete(() => log('Login Request Completed'));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final retriev = jsonEncode(response.data);
        retrievedUser = profileModelFromJson(retriev);
        SharedService.setLoginDetails(retrievedUser);
        print('login success');
        log(jsonEncode(response.data));
        // log(retrievedUser.toString());
      } else if (response.statusCode == 400) {
        print(response.statusMessage);
        log('Password Not Matching');
      } else if (response.statusCode == 401) {
        print(response.statusMessage);
      } else if (response.statusCode == 404) {
        log('User Not Found');
        print(response.statusMessage);
      } else if (response.statusCode == 500) {
        print(response.statusMessage);
      }
    } on DioError catch (e) {
      log(e.message);
      throw e.error;
    } catch (e) {
      log(e.toString());
    }
    return retrievedUser;
  }

  Future<ProfileModel?> getUserProfile() async {
    final isLoggedIn = await SharedService.isLoggedIn();
    if (isLoggedIn) {
      final ProfileModel = await SharedService.getUserProfile();
      return ProfileModel!;
    } else {
      return null;
    }
  }
}

class Signup extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(err.message);
    super.onError(err, handler);
    // throw err;
    return super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(response.statusMessage);
    if (response != null) {
      log(response.statusMessage!);
      if (response.statusCode! >= 500) {
        throw response;
      }
    }
    // throw response
    return super.onResponse(response, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // print()
    return super.onRequest(options, handler);
  }
}
