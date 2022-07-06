import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_box/data/core/api_end_points.dart';
import 'package:open_box/data/models/user/m_user.dart';
import 'package:open_box/infrastructure/helper/shared_service.dart';

class UserFunc {
  static const userBaseUrl = 'http://192.168.43.244:5000/user';

  final dio = Dio(BaseOptions(baseUrl: 'localhost:5000'));
  Future<UserData?> getUser({required String id}) async {
    UserData? retrievedUser;
    // final data = signUpData.toJson();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    try {
      Response response = await dio.get(
        // 'http://localhost:5000/auth/register',
        // '${ApiEndPoints.apiBaseUrl}/user/$id',
        '$userBaseUrl/$id',
        options: Options(headers: requestHeaders),
      );
      // data: jsonEncode(data),
      // var url = Uri.parse('http://localhost:3000/auth/register');
      // var url = Uri.parse('http://192.168.1.102:5000/auth/register/');
// var response = await http.post(url, body: jsonEncode(data));
      if (response.statusCode == 200 || response.statusCode == 201) {
        retrievedUser = UserData.fromJson(response.data);
        // final toc = response.requestOptions.cancelToken;
        print('user found');
      }
    } on DioError catch (e) {
      print(e);
    } catch (e) {
      log(e.toString());
    }
    return retrievedUser;
  }

  Future<UserData?> updateUser({required String id}) async {
    final token = await SharedService.getUserProfile();
    UserData? retrievedUser;
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': token!.token!
    };
    try {
      Response response = await dio.put('$userBaseUrl/$id',
          options: Options(headers: requestHeaders));

      if (response.statusCode == 200 || response.statusCode == 201) {
        retrievedUser = UserData.fromJson(response.data);
      }
    } on DioError catch (e) {
      throw e.error;
    } catch (e) {
      log(e.toString());
    }
    return retrievedUser;
  }

  Future<UserData?> deleteUser({required String id,BuildContext? context}) async {
    final token = 
    await SharedService.getUserProfile();

    UserData? retrievedUser;
    if (token != null) {
      Map<String, dynamic> requestHeaders = {
        "Content-Type": "application/json",
        "authorization":
            "Bearer ${token.token}"
      };
      Map<String, dynamic> body = {"currentUserId": id};

      try {
        Response response = await dio.delete(
          // 'http://localhost:5000/auth/register',
          '$userBaseUrl/$id',
          options: Options(
            headers: requestHeaders,
          ),
          data: body,
        ).then((res) async{
          if (res!=null){
           await  SharedService.logout(context!);
          }
          return res;
        });

        if (response.statusCode == 200 || response.statusCode == 201) {
          // final dat = jsonDecode(response.data);
          // retrievedUser = UserData.fromJson(dat);
          log("User Removed");
        }
      } on DioError catch (e) {
        log(e.message);
        print("Make sure the Access of Account");
        if (e.response!.statusCode == 403) {
          log('Authorization issue');
        } else if (e.response!.statusCode! >= 400) {
          print(e.message);
        }
        // throw e.error;
      } catch (e) {
        log(e.toString());
      }
      return retrievedUser;
    } else {
      log('Token not exists');
      return null;
    }
  }

  Future<UserData?> followUser({required String id}) async {
    UserData? retrievedUser;

    try {
      Response response = await dio.get(
        // 'http://localhost:5000/auth/register',
        '$ApiEndPoints.apiBaseUrl/user/$id/follow',
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        retrievedUser = UserData.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e);
    } catch (e) {
      log(e.toString());
    }
    return retrievedUser;
  }

  Future<UserData?> unfollowUser({required String id}) async {
    UserData? retrievedUser;

    try {
      Response response = await dio.get(
        // 'http://localhost:5000/auth/register',
        'http://192.168.8.104:5000/user/$id/unfollow',
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        retrievedUser = UserData.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e);
    } catch (e) {
      log(e.toString());
    }
    return retrievedUser;
  }
}
