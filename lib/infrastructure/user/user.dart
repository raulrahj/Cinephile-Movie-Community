import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_box/data/core/api_end_points.dart';
import 'package:open_box/data/models/user/m_profile.dart';
import 'package:open_box/data/models/user/m_user.dart';
import 'package:open_box/infrastructure/helper/shared_service.dart';

class UserRepo {
  static const userBaseUrl = ApiEndPoints.user;
//192.168.43.244
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

        retrievedUser = UserModel.fromJson(response.data);

        log("${response.statusCode.toString()} () user found");
      }
    } on DioError catch (e) {
      print(e);
    } catch (e) {
      log(e.toString());
    }
    return retrievedUser;
  }

  Future<ProfileModel?> updateUser(
      {required String id, required UserResp userData}) async {
    final profileData = await SharedService.getUserProfile();
    ProfileModel? retrievedUser;
    Map<String, dynamic> requestHeaders = {
      'Content-Type': 'application/json',
      'authorization': "Bearer ${profileData!.token}"
    };
    final Map<String, dynamic> data = {
      "auth": true,
      "_id": userData.id,
      "username": userData.username,
      // "password": "123456",
      "firstname": userData.firstname.toString(),
      // "firstname": userData.firstname ?? profileData.user!.firstname,
      "lastname": userData.lastname.toString(),
      "isAdmin": false,
      "followers": ["62be900600b1aef58e50695d"],
      "following": ["62be900600b1aef58e50695d"],
      "createdAt": "2022-07-03T07:44:14.968Z",
      "updatedAt": "2022-07-06T20:02:29.898Z",
      "profilePicture": userData.profilePicture ??
          "20220714170501282918image_cropper_1657798489308.jpg",
      "coverPicture": "20220714171547285772image_cropper_1657799084143.jpg",
      "about": userData.about.toString(),
      "__v": 0
    };

    try {
      Response response = await dio.put('$userBaseUrl/$id',
          options: Options(headers: requestHeaders),
          data: jsonEncode(data), onSendProgress: (int r, int l) async {
        print(jsonEncode(data));
        log("Request Update User");
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Updated Successfully !!!");
        // log(jsonDecode(response.data));
        // retrievedUser = ProfileModel.fromJson(response.data);
        final retriev = jsonEncode(response.data);
        retrievedUser = profileModelFromJson(retriev);
        await SharedService.setLoginDetails(retrievedUser);
        print('Added data in Local !!!');
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

  Future<UserModel?> followUser({required String id}) async {
    UserModel? retrievedUser;
    final currentUser = await SharedService.getUserProfile();
    if (currentUser != null) {
      Map<String, dynamic> requestHeaders = {
        "Content-Type": "application/json",
        "authorization": "Bearer ${currentUser.token}"
      };
      Map<String, dynamic> body = {"_Id": id};

      try {
        Response response = await dio.put('$userBaseUrl/$id/follow',
            data: {"_id": currentUser.user!.id});

        if (response.statusCode == 200 || response.statusCode == 201) {
          retrievedUser = UserModel.fromJson(response.data);
        }
      } on DioError catch (e) {
        print(e);
      } catch (e) {
        log(e.toString());
      }
      return retrievedUser;
    }
  }

  Future<UserModel?> unFollowUser({required String id}) async {
    UserModel? retrievedUser;
    final currentUser = await SharedService.getUserProfile();
    if (currentUser != null) {
      Map<String, dynamic> requestHeaders = {
        "Content-Type": "application/json",
        "authorization": "Bearer ${currentUser.token}"
      };
      try {
        Response response = await dio.put('$userBaseUrl/$id/unfollow',
            data: {"_id": currentUser.user!.id},
            options: Options(headers: requestHeaders));
        log(response.statusMessage!);
        if (response.statusCode == 200 || response.statusCode == 201) {
          retrievedUser = UserModel.fromJson(response.data);
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
}
