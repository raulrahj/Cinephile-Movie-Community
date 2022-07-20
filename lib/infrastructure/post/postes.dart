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
      print(" REQUEST REACHED !!!!");
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
    List<Comment>? res;
    Map<String, dynamic> commentedUser = {
      "commentedUserData": {
        "_id": "62c4b7255c03f763422ce5ae",
        "username": "krishnan@gmail.com",
        // "password": """$2b$10$0L2FZBi49v2RQGBmxrWZx.Cd3XfjAElSjSZsHjimh0eFZTL9ibhIC""",
        "firstname": "krishnan",
        "lastname": "Das",
        "isAdmin": false,
        "auth": true,
        "followers": [],
        "following": [],
        "createdAt": "2022-07-05T22:11:50.135Z",
        "updatedAt": "2022-07-06T03:41:54.868Z",
        "__v": 0
      }
    };

    Map<String, dynamic> data = {
      "postId": comment.postId,
      "commentText": comment.text,
      "postedBy": comment.postedBy,
      "userData": jsonEncode(commentedUser)
    };

    try {
      final response = await dio.post("$postUrl/comments/",
          options: Options(headers: requestHeaders), data: jsonEncode(data));
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('TRUEEEEEEEEEEEEEE');
        log(response.data.toString());
        final retriev = jsonEncode(response.data);
        // res = Comment()
      }
      return null;
    } on DioError catch (e) {
      print(e);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
