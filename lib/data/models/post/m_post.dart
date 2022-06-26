import 'package:open_box/data/models/user/m_user.dart';

class Post {
  final User userId;
  final String disc;
  final List<User>? likes;
  final String? image;

  Post({
    required this.userId,
    required this.disc,
    this.likes,
    this.image,
  });
  static Post fromJson(Map<String, dynamic> json) => Post(
        userId: json['userId'],
        disc: json['disc'],
        likes: json['likes'],
        image: json['image'],
      );

  //a method that convert object to json
  Map<String, dynamic> toJson() =>
      {'name': userId, 'disc': disc, 'likes': likes, "image": image};
}
