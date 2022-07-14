// class User{

// }

// import 'dart:convert';

// UserData userFromJson(String str) => UserData.fromJson(json.decode(str));

// String userModelToJson(UserData data) => json.encode(data.toJson());

// class UserData {
//   final String userName;
//   final String password;
//   final String firstName;
//   final String? lastName;
//   final String? profilePic;
//   final String? coverPic;
//   final String? about;
//   final String? livesIn;
//   final String? worksAt;
//   final String? relationship;
//   final bool? isAdmin;
//   final List<UserData>? following;
//   final List<UserData>? followers;

//   UserData(
//       {required this.userName,
//       required this.password,
//       required this.firstName,
//       required this.lastName,
//       this.profilePic,
//       this.coverPic,
//       this.about,
//       this.livesIn,
//       this.worksAt,
//       this.relationship,
//       this.isAdmin,
//       this.following,
//       this.followers});

//   factory UserData.fromJson(Map<String, dynamic> json) => UserData(
//         userName: json['userName'],
//         password: json['password'],
//         firstName: json['firstName'],
//         lastName: json['lastName'],
//         profilePic: json['profilePicture'],
//         coverPic: json['coverPicture'],
//         about: json['about'],
//         livesIn: json['livesIn'],
//         worksAt: json['workAt'],
//         relationship: json['relationShip'],
//         isAdmin: json['isAdmin'],
//         followers: json['followers'],
//         following: json['following'],
//       );
//   Map<String, dynamic> toJson() => {
//         'userName': userName,
//         'password': password,
//         'firstName': firstName,
//         'lastName': lastName,
//         'profilePicture': profilePic,
//         'coverPicture': coverPic,
//         'about': about,
//         'livesIn': livesIn,
//         'workAt': worksAt,
//         'relationShip': relationship,
//         'isAdmin': isAdmin,
//         'following': following,
//         'followers': followers,
//       };
// }
// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

// import 'dart:convert';

// UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

// String userDataToJson(UserData data) => json.encode(data.toJson());

// class UserData {
//   UserData({
//     this.id,
//     required this.username,
//     required this.firstname,
//     required this.lastname,
//     this.isAdmin,
//     this.followers,
//     this.following,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//     this.password

//   });

//   String? id;
//   String username;
//   String firstname;
//   String? lastname;
//   bool? isAdmin;
//   List<dynamic>? followers;
//   List<dynamic>? following;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? v;
//   String? password;

//   factory UserData.fromJson(Map<String, dynamic> json) => UserData(
//         id: json["_id"],
//         username: json["username"],
//         firstname: json["firstname"],
//         lastname: json["lastname"],
//         isAdmin: json["isAdmin"],
//         followers: List<dynamic>.from(json["followers"].map((x) => x)),
//         following: List<dynamic>.from(json["following"].map((x) => x)),
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "username": username,
//         "firstname": firstname,
//         "lastname": lastname,
//         "isAdmin": isAdmin,
//         "followers": List<dynamic>.from(followers!.map((x) => x)),
//         "following": List<dynamic>.from(following!.map((x) => x)),
//         "createdAt": createdAt!.toIso8601String(),
//         "updatedAt": updatedAt!.toIso8601String(),
//         "__v": v,
//       };
// }
// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelDataToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.user,
    this.token,
  });

  UserResp? user;
  String? token;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        user: UserResp.fromJson(json["user"]),
        token: json["token"],
      );

  get userData => null;

  Map<String, dynamic> toJson() => {
        "user": user!.toJson(),
        "token": token,
      };
}

class UserResp {
  UserResp(
      {this.id,
      required this.username,
      this.password,
      required this.firstname,
      required this.lastname,
      this.isAdmin,
      this.followers = const [],
      this.following = const [],
      this.createdAt,
      this.updatedAt,
      this.v,
      this.about,
      this.country,
      this.coverPicture,
      this.livesin,
      this.profilePicture,
      this.relationship,
      this.worksAt});

  String? id;
  String username;
  String? password;
  String firstname;
  String lastname;
  bool? isAdmin;
  List<dynamic>? followers;
  List<dynamic>? following;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? profilePicture;
  String? coverPicture;
  String? about;
  String? livesin;
  String? worksAt;
  String? country;
  String? relationship;

  factory UserResp.fromJson(Map<String, dynamic> json) => UserResp(
        id: json["_id"],
        username: json["username"],
        password: json["password"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        isAdmin: json["isAdmin"],
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
        following: List<dynamic>.from(json["following"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        profilePicture: json["profilePicture"],
        coverPicture: json["coverPicture"],
        about: json["about"],
        livesin: json["livesin"],
        worksAt: json["worksAt"],
        country: json["country"],
        relationship: json["relationship"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "password": password,
        "firstname": firstname,
        "lastname": lastname,
        "isAdmin": isAdmin,
        "followers": followers == null
            ? []
            : List<dynamic>.from(followers!.map((x) => x)),
        "following": following == null
            ? []
            : List<dynamic>.from(following!.map((x) => x)),
        "createdAt": createdAt == null ? '' : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? '' : updatedAt!.toIso8601String(),
        "profilePicture": profilePicture,
        "coverPicture": coverPicture,
        "about": about,
        "livesin": livesin,
        "worksAt": worksAt,
        "country": country,
        "relationship": relationship,
        "__v": v,
      };
}
