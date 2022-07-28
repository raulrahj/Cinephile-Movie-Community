import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_box/data/core/api_end_points.dart';
import 'package:open_box/data/models/post/m_post.dart';
import 'package:open_box/infrastructure/helper/shared_service.dart';

class PostRepo {
  static const postUrl = ApiEndPoints.post;

  final dio = Dio(BaseOptions(baseUrl: 'localhost:5000'));
  Map<String, String> requestHeaders = {
    'Content-Type': 'application/json',
    'Authorization': ''
  };

  Future createPost({
    required Post postDat,
  }) async {
    final currentUser = await SharedService.getUserProfile();
    final Map<String, dynamic> postData = {
      "desc": postDat.desc,
      "userId": currentUser!.user!.id,
      "image": postDat.image,
      "comments": [],
      "likes": []
    };
    final data = postData;

    try {
      Response response = await dio.post('$postUrl/', data: jsonEncode(data),
          onSendProgress: (int r, int l) async {
        log('Request New Post !!!');
      }, options: Options(headers: requestHeaders));
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.statusMessage!);
        final retrievedPost = jsonEncode(response.data);
        return retrievedPost;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future updatePost({required Post postData, required String postId}) async {
    final data = postData.toJson();

    try {
      Response response = await dio.put('$postUrl/$postId',
          data: jsonEncode(data), options: Options(headers: requestHeaders));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final retrievedPost = jsonEncode(response.data);
        return retrievedPost;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future deletePost({required String id}) async {
    // final data = postData;

    try {
      Response response = await dio.delete('$postUrl/$id',
          options: Options(headers: requestHeaders));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final retrievedPost = jsonEncode(response.data);
        return retrievedPost;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<Response?> likePost({
    required String id,
  }) async {
    final userData = await SharedService.getUserProfile();
    try {
      Response response = await dio.put('$postUrl/$id/like',
          data: jsonEncode({"userId": userData!.user!.id}),
          options: Options(headers: requestHeaders));
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data);
        final retrievedPost = response;
        return retrievedPost;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<Post?>> getTimeLinePost({required String id}) async {
    List<Post>? res;

    try {
      final response = await dio.get('$postUrl/$id/timeline',
          options: Options(headers: requestHeaders));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonEncode(response.data);
        res = postFromJson(data);
        return res;
      } else {}
    } catch (e) {
      log(e.toString());
    }
    return res!;
  }

  Future<List<Post?>> getUserPostes({required String userId}) async {
    List<Post>? res;
    List<Post> userPostes = [];
    try {
      final response =
          await dio.get('$postUrl/', options: Options(headers: requestHeaders));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonEncode(response.data);
        res = postFromJson(data);
        await Future.forEach(res, (Post element) async {
          if (element.userId == userId) {
            userPostes.add(element);
          }
        });

        return userPostes;
      } else {}
    } catch (e) {
      log(e.toString());
    }
    return userPostes;
  }

  Future<Post>? getPost({required String id}) async {
    Post? res;

    try {
      final response = await dio.get('$postUrl/$id',
          options: Options(headers: requestHeaders));
      if (response.statusCode == 200 || response.statusCode == 201) {
        res = jsonDecode(response.data);
        return res!;
      } else {}
    } catch (e) {
      log(e.toString());
    }
    return res!;
  }

  Future<List<Post>>? allPost() async {
    List<Post>? res;

    try {
      final response =
          await dio.get(postUrl, options: Options(headers: requestHeaders));
      if (response.statusCode == 200 || response.statusCode == 201) {
        // res = response.data;

        // log(response.data.toString());
        final retriev = jsonEncode(response.data);
        res = postFromJson(retriev);
        return res;
      } else {
        log(response.statusMessage!);
      }
    } catch (e) {
      log(e.toString());
    }
    return res!;
  }

  Future<Comment?> addComment(Comment comment) async {
    final currentUser = await SharedService.getUserProfile();
    List<Comment>? retrieved;
    Map<String, dynamic> commentedUser = {
      "commentedUserData": {
        "_id": currentUser!.user!.id,
        "username": currentUser.user!.username,
        "firstname": currentUser.user!.firstname,
        "lastname": currentUser.user!.lastname,
        "isAdmin": false,
        "auth": true,
        "followers": currentUser.user!.followers,
        "following": currentUser.user!.following,
        "createdAt": currentUser.user!.createdAt.toString(),
        "updatedAt": currentUser.user!.updatedAt.toString(),
        "__v": currentUser.user!.v
      }
    };

    Map<String, dynamic> data = {
      "postId": comment.postId,
      "commentText": comment.text,
      "postedBy": currentUser.user!.id,
      "userData": jsonEncode(commentedUser)
    };

    try {
      final response = await dio.post("$postUrl/comments/",
          options: Options(headers: requestHeaders), data: jsonEncode(data));
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.statusCode.toString());
      }
      return null;
    } on DioError catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
