import 'package:open_box/data/models/user/m_profile.dart';
import 'dart:convert';

// class Post {
//   final User userId;
//   final String disc;
//   final List<User>? likes;
//   final String? image;

//   Post({
//     required this.userId,
//     required this.disc,
//     this.likes,
//     this.image,
//   });
//   static Post fromJson(Map<String, dynamic> json) => Post(
//         userId: json['userId'],
//         disc: json['disc'],
//         likes: json['likes'],
//         image: json['image'],
//       );

//   //a method that convert object to json
//   Map<String, dynamic> toJson() =>
//       {'name': userId, 'disc': disc, 'likes': likes, "image": image};
// }
// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

// Post postFromJson(String str) => Post.fromJson(json.decode(str));

// String postToJson(Post data) => json.encode(data.toJson());

// class Post {
//     Post({
//         required this.id,
//         required this.userId,
//         this.desc,
//          this.comments,
//         this.likes,
//         this.image,
//         this.createdAt,
//         this.updatedAt,
//         this.v,
//     });

//     String id;
//     String userId;
//     String? desc;
//     List<dynamic>? comments;
//     List<dynamic>? likes;
//     String? image;
//     DateTime? createdAt;
//     DateTime? updatedAt;
//     int? v;

//     factory Post.fromJson(Map<String, dynamic> json) => Post(
//         id: json["_id"],
//         userId: json["userId"],
//         desc: json["desc"],
//         comments: List<dynamic>.from(json["comments"].map((x) => x)),
//         likes: List<dynamic>.from(json["likes"].map((x) => x)),
//         image: json["image"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "userId": userId,
//         "desc": desc,
//         "comments": List<dynamic>.from(comments!.map((x) => x)),
//         "likes": List<dynamic>.from(likes!.map((x) => x)),
//         "image": image,
//         "createdAt": createdAt!.toIso8601String(),
//         "updatedAt": updatedAt!.toIso8601String(),
//         "__v": v,
//     };
// }
// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

// import 'dart:convert';

// List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

// String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Post {
//     Post({
//      required this.id,
//         required this.userId,
//         this.desc,
//          this.comments,
//         this.likes,
//         this.image,
//         this.createdAt,
//         this.updatedAt,
//         this.v,
//     });

//     String id;
//     String userId;
//     String? desc;
//     List<dynamic>? comments;
//     List<dynamic>? likes;
//     String? image;
//     DateTime? createdAt;
//     DateTime? updatedAt;
//     int? v;
//     factory Post.fromJson(Map<String, dynamic> json) => Post(
//         id: json["_id"],
//         userId: json["userId"],
//         desc: json["desc"],
//         comments: List<dynamic>.from(json["comments"].map((x) => x)),
//         likes: List<String>.from(json["likes"].map((x) => x)),
//         image: json["image"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "userId": userId,
//         "desc": desc,
//         "comments": List<dynamic>.from(comments!.map((x) => x)),
//         "likes": List<dynamic>.from(likes!.map((x) => x)),
//         "image": image,
//         "createdAt": createdAt!.toIso8601String(),
//         "updatedAt": updatedAt!.toIso8601String(),
//         "__v": v,
//     };
// }
// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

// import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    this.id,
    this.userId,
    this.desc,
    this.comments,
    this.likes,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? userId;
  String? desc;
  List<Comment>? comments;
  List<String>? likes;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["_id"],
        userId: json["userId"],
        desc: json["desc"],
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
        likes: List<String>.from(json["likes"].map((x) => x)),
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "desc": desc,
        "comments": List<dynamic>.from(comments!.map((x) => x.toJson())),
        "likes": List<dynamic>.from(likes!.map((x) => x)),
        "image": image,
        "createdAt": createdAt == null
            ? DateTime.now().toIso8601String()
            : createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}

CommentList commentListFromJson(String str) =>
    CommentList.fromJson(json.decode(str));

String commentListToJson(CommentList data) => json.encode(data.toJson());

class CommentList {
  CommentList({
    this.comments,
  });

  List<Comment>? comments;

  factory CommentList.fromJson(Map<String, dynamic> json) => CommentList(
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "comments": List<dynamic>.from(comments!.map((x) => x.toJson())),
      };
}

class Comment {
  Comment({
    this.postId,
    this.text,
    this.postedBy,
    this.commentedUserData,
  });

  String? postId;
  String? text;
  String? postedBy;
  CommentedUserData? commentedUserData;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        postId: json["postId"],
        text: json["text"],
        postedBy: json["postedBy"],
        commentedUserData:
            CommentedUserData.fromJson(json["commentedUserData"]),
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "text": text,
        "postedBy": postedBy,
        "commentedUserData": commentedUserData!.toJson(),
      };
}

class CommentedUserData {
  CommentedUserData({
    this.id,
    this.username,
    this.password,
    this.firstname,
    this.lastname,
    this.isAdmin,
    this.auth,
    this.followers,
    this.following,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? username;
  String? password;
  String? firstname;
  String? lastname;
  bool? isAdmin;
  bool? auth;
  List<dynamic>? followers;
  List<dynamic>? following;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory CommentedUserData.fromJson(Map<String, dynamic> json) =>
      CommentedUserData(
        id: json["_id"],
        username: json["username"],
        password: json["password"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        isAdmin: json["isAdmin"],
        auth: json["auth"],
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
        following: List<dynamic>.from(json["following"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "password": password,
        "firstname": firstname,
        "lastname": lastname,
        "isAdmin": isAdmin,
        "auth": auth,
        "followers": List<dynamic>.from(followers!.map((x) => x)),
        "following": List<dynamic>.from(following!.map((x) => x)),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
