// import 'dart:convert';
// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:open_box/data/models/post/m_post.dart';

// class Post {
//     final dio = Dio(BaseOptions(baseUrl: 'localhost:5000'));

//   Future<List<Post?>> getTimeLinePost(String id) async {
//     List<Post>? res;
//     try {
//       final response =
//           await dio.get('/62ac12c033cde9b7e78bb802/getTimeLinePosts');
//        res = jsonDecode(response.data);
//       if(response.statusCode==200||response.statusCode==201){
//         return res!;
//       }else{
//         print(response.statusCode);
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//     return res!;
//   }




//   Future signUp({required Post postData}) async {
//     // UserData? retrievedUser;
//     // final data = UserSRes
//     final data= postData;
    
//     try {
//       Response response = await dio.post(
//         'http://localhost:5000/auth/register',
//         data: data,
//       );
//       if (response.statusCode == 200 || response.statusCode == 201) {
//       final  retrievedPost = jsonEncode(response.data);
//         print('user registered');
//     return retrievedPost;

//       }
//     } catch (e) {
//       log(e.toString());
//     }
//   }

// }