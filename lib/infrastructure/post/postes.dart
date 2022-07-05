import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:open_box/data/models/post/m_post.dart';

class PostFunc {
  static const postUrl = "http://localhost:5000/post";
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

  Future<List<Post?>> getTimeLinePost(String id) async {
    List<Post>? res;

    try {
      final response = await dio.get(
          '$postUrl/62ac12c033cde9b7e78bb802/getTimeLinePosts',
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

  Future<List<Post?>> getPost({required String id}) async {
    List<Post>? res;

    try {
      final response = await dio.get(
          '$postUrl/$id',
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
}
