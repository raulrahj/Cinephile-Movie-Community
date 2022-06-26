import 'dart:developer';

import 'package:dio/dio.dart';

// class Post{
//   Future<List<Post?>> getTimeLinePost(String id)async{
//     List<Post> res;
//   final dio = Dio(BaseOptions(baseUrl: 'localhost:5000'));
//   try{
//    List<Response> response = await dio.get('/62ac12c033cde9b7e78bb802/getTimeLinePosts');
//    res = Post.fromJson(response);
//   }catch(e){
//     log(e.toString());
//   }
//   // return 
//   }
// }