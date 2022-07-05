import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:open_box/data/core/api_end_points.dart';
import 'package:open_box/data/models/user/m_user.dart';

class UserFunc {
  final dio = Dio(BaseOptions(baseUrl: 'localhost:5000'));
  var token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhdWwiLCJpZCI6IjYyYzE0OGNlNjhmM2I5NzYzYWQzOWUwYSIsImlhdCI6MTY1Njk5NDU2NywiZXhwIjoxNjU2OTk4MTY3fQ.0ELakCvgSOAORcr5QGrE-XlyQ4JQ4rBx150WC_L5uVM";
  Future<UserData?> getUser({required String id}) async {
    UserData? retrievedUser;
    // final data = signUpData.toJson();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': token
    };

    try {
      Response response = await dio.get(
        // 'http://localhost:5000/auth/register',
        '${ApiEndPoints.apiBaseUrl}/user/$id',
        options: Options(headers: requestHeaders),
      );
      // data: jsonEncode(data),
      // var url = Uri.parse('http://localhost:3000/auth/register');
      // var url = Uri.parse('http://192.168.1.102:5000/auth/register/');
// var response = await http.post(url, body: jsonEncode(data));
      if (response.statusCode == 200 || response.statusCode == 201) {
        retrievedUser = UserData.fromJson(response.data);
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
    UserData? retrievedUser;

    try {
      Response response = await dio.get(
        'http://192.168.1.105:5000/user/$id',
      );

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

  Future<UserData?> deleteUser({required String id}) async {
    UserData? retrievedUser;

    try {
      Response response = await dio.get(
        // 'http://localhost:5000/auth/register',
        'http://192.168.1.105:5000/user/$id',
      );

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
