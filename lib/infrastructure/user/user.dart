import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_box/data/models/user/m_profile.dart';
import 'package:open_box/data/models/user/m_user.dart';
import 'package:open_box/infrastructure/helper/shared_service.dart';

class UserFunc {
  static const userBaseUrl = 'http://192.168.43.244:5000/user';

  final dio = Dio(BaseOptions(baseUrl: 'localhost:5000'));
  Future<UserModel?> getUser({required String id}) async {
    UserModel? retrievedUser;
    // final data = signUpData.toJson();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    try {
      Response response = await dio.get(
        '$userBaseUrl/$id',
        options: Options(
          headers: requestHeaders,
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());

        retrievedUser = UserModel.fromJson(response.data);
        print(retrievedUser == null);

        log('user found');
      }
    } on DioError catch (e) {
      print(e);
    } catch (e) {
      log(e.toString());
    }
    return retrievedUser;
  }

  Future<ProfileModel?> updateUser({required String id}) async {
    final token = await SharedService.getUserProfile();
    ProfileModel? retrievedUser;
    Map<String, dynamic> requestHeaders = {
      'Content-Type': 'application/json',
      'authorization': "Bearer ${token!.token}"
    };
    final Map<String, dynamic> data = {
      "auth": true,
      "_id": "62c148ce68f3b9763ad39e0a",
      "username": "raul",
      "password": token.user!.password!,
      "firstname": "raulrahj",
      "lastname": "ul",
      "isAdmin": false,
      "followers": ["62be900600b1aef58e50695d"],
      "following": ["62be900600b1aef58e50695d"],
      "createdAt": "2022-07-03T07:44:14.968Z",
      "updatedAt": "2022-07-06T20:02:29.898Z",
      "__v": 0
    };

    // final da = profileModelFromJson(jsonEncode(data));
    try {
      Response response = await dio.put('$userBaseUrl/$id',
          options: Options(headers: requestHeaders),
          data: jsonEncode(data), onSendProgress: (int r, int l) async {
        log("Request Update User");
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data);
        // retrievedUser = ProfileModel.fromJson(response.data);
        final retriev = jsonEncode(response.data);
        retrievedUser = profileModelFromJson(retriev);
        SharedService.setLoginDetails(retrievedUser);
      } else if (response.statusCode == 500) {
        print('Internal Server Error !!!');
      } else if (response.statusCode == 403) {
        print('Access Denied !!!');
      }
    } on DioError catch (e) {
      throw e.error;
    } catch (e) {
      log(e.toString());
    }
    return retrievedUser;
  }

  Future<ProfileModel?> deleteUser(
      {required String id, BuildContext? context}) async {
    final token = await SharedService.getUserProfile();

    ProfileModel? retrievedUser;
    if (token != null) {
      Map<String, dynamic> requestHeaders = {
        "Content-Type": "application/json",
        "authorization": "Bearer ${token.token}"
      };
      Map<String, dynamic> body = {"currentUserId": id};

      try {
        Response response = await dio
            .delete(
          '$userBaseUrl/$id',
          options: Options(
            headers: requestHeaders,
          ),
          data: body,
        )
            .then((res) async {
          if (res != null) {
            await SharedService.logout(context!);
          }
          return res;
        });

        if (response.statusCode == 200 || response.statusCode == 201) {
          log(response.statusMessage!);
          // final dat = jsonDecode(response.data);
          // retrievedUser = ProfileModel.fromJson(dat);
          log("User Removed");
        } else if (response.statusCode == 403) {
          print('Access Denied !!!');
        } else if (response.statusCode == 500) {
          print('Server Failure !!!');
          log(response.statusMessage!);
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

  Future<ProfileModel?> followUser({required String id}) async {
    ProfileModel? retrievedUser;
    final currentUser = await SharedService.getUserProfile();
    try {
      Response response = await dio
          .put('$userBaseUrl/$id/follow', data: {"_id": currentUser!.user!.id});

      if (response.statusCode == 200 || response.statusCode == 201) {
        retrievedUser = ProfileModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e);
    } catch (e) {
      log(e.toString());
    }
    return retrievedUser;
  }

  Future<ProfileModel?> unFollowUser({required String id}) async {
    ProfileModel? retrievedUser;
    final currentUser = await SharedService.getUserProfile();
    try {
      Response response = await dio.put('$userBaseUrl/$id/unfollow',
          data: {"_id": currentUser!.user!.id});
      log(response.statusMessage!);
      if (response.statusCode == 200 || response.statusCode == 201) {
        retrievedUser = ProfileModel.fromJson(response.data);
      } else if (response.statusCode == 403) {
        print('Not following !!!');
      } else if (response.statusCode == 500) {
        print('Internal Server error !!!');
      }
    } on DioError catch (e) {
      print(e);
    } catch (e) {
      log(e.toString());
    }
    return retrievedUser;
  }
}