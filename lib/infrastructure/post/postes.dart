import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:open_box/data/models/post/m_post.dart';

class PostFunc {
  static const postUrl = "http://192.168.43.244:5000/post";
  static const postUrl1 = "http://192.168.100.174:5000/post";
  final dio = Dio(BaseOptions(baseUrl: 'localhost:5000'));
  Map<String, String> requestHeaders = {
    'Content-Type': 'application/json',
    'Authorization': ''
  };

  Future createPost({required Post postData, required String id}) async {
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

  Future likePost({required String id}) async {
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

  Future<List<Post?>> getTimeLinePost({required String id}) async {
    List<Post>? res;

    try {
      final response = await dio.get('$postUrl1/$id/timeline',
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

  Future<List<Post?>> getPost({required String id}) async {
    List<Post>? res;

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
        res = response.data;

        log(response.data.toString());
        return res!;
      } else {
        log(response.statusMessage!);
      }
    } catch (e) {
      log(e.toString());
    }
    return res!;
  }
}
