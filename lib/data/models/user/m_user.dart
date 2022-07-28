
import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    required this.id,
    required this.username,
    required this.firstname,
    required this.lastname,
    this.isAdmin,
    this.followers,
    this.following,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.about,
    this.country,
    this.coverPicture,
    this.livesin,
    this.profilePicture,
    this.relationship,
    this.worksAt,
    this.auth,
  });

  final String id;
  final String username;
  final String firstname;
  final String lastname;
  final bool? isAdmin;
  final List<dynamic>? followers;
  final List<dynamic>? following;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? profilePicture;
  final String? coverPicture;
  final String? about;
  final String? livesin;
  final String? worksAt;
  final String? country;
  final String? relationship;
  final bool? auth;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        username: json["username"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        isAdmin: json["isAdmin"],
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
        following: List<dynamic>.from(json["following"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        profilePicture: json["profilePicture"],
        coverPicture: json["coverPicture"],
        about: json["about"],
        livesin: json["livesin"],
        worksAt: json["worksAt"],
        country: json["country"],
        relationship: json["relationship"],
        auth: json["auth"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "firstname": firstname,
        "lastname": lastname,
        "isAdmin": isAdmin,
        "followers": followers == null
            ? []
            : List<dynamic>.from(followers!.map((x) => x)),
        "following": following == null
            ? []
            : List<dynamic>.from(following!.map((x) => x)),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
        "profilePicture": profilePicture,
        "coverPicture": coverPicture,
        "about": about,
        "livesin": livesin,
        "worksAt": worksAt,
        "country": country,
        "relationship": relationship,
        "auth": auth,
      };
}
