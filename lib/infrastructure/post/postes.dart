import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:open_box/config/core.dart';
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

  Future createPost({required Post postDat, required String id}) async {
    final Map<String, dynamic> postData = {
      "desc": postDat.desc,
      "userId": '62cd0d25a06157de0a2496c1',
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

  Future updatePost({required Post postData, required String id}) async {
    final data = postData;

    try {
      Response response = await dio.post('$postUrl/$id',
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
      Response response = await dio.post('$postUrl/$id',
          options: Options(headers: requestHeaders));
      if (response.statusCode == 200 || response.statusCode == 201) {
        final retrievedPost = jsonEncode(response.data);
        return retrievedPost;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future likePost({
    required String id,
  }) async {
    final userData = await SharedService.getUserProfile();
    try {
      print(" REQUEST REACHED !!!!");
      Response response = await dio.put('$postUrl/$id/like',
          data: jsonEncode({"userId": userData!.user!.id}),
          options: Options(headers: requestHeaders));
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.statusMessage!);
        print('POST LIKED');
        final retrievedPost = jsonEncode(response.data);
        return retrievedPost;
      }
    } catch (e) {
      log(e.toString());
    }
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

  Future<List<Post?>> getUserPostes() async {
    List<Post>? res;
    List<Post> userPostes = [];
    print('userPost');
    try {
      final response =
          await dio.get('$postUrl/', options: Options(headers: requestHeaders));
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('all post');
        final data = jsonEncode(response.data);
        res = postFromJson(data);
        await Future.forEach(res, (Post element) async {
          if (element.userId == '62cd0d25a06157de0a2496c1') {
            print('user matched');
            userPostes!.add(element);
          }
        });

        return userPostes!;
      } else {}
    } catch (e) {
      log(e.toString());
    }
    return userPostes!;
  }

  Future<Post>? getPost({required String id}) async {
    Post? res;

    try {
      final response = await dio.get('$postUrl/$id',
          options: Options(headers: requestHeaders));
      res = jsonDecode(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
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

        log(response.data.toString());
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
}
