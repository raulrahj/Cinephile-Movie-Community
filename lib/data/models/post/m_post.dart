import 'package:open_box/data/models/user/m_user.dart';
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


Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
    Post({
        required this.id,
        required this.userId,
        this.desc,
         this.comments,
        this.likes,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String id;
    String userId;
    String? desc;
    List<dynamic>? comments;
    List<dynamic>? likes;
    String? image;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["_id"],
        userId: json["userId"],
        desc: json["desc"],
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        likes: List<dynamic>.from(json["likes"].map((x) => x)),
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "desc": desc,
        "comments": List<dynamic>.from(comments!.map((x) => x)),
        "likes": List<dynamic>.from(likes!.map((x) => x)),
        "image": image,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}
