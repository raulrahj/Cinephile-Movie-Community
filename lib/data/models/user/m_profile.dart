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
        // createdAt: DateTime.parse(json["createdAt"]),
        // updatedAt: DateTime.parse(json["updatedAt"]),
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
        "createdAt": createdAt == null
            ? DateTime.now().toIso8601String()
            : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null
            ? DateTime.now().toIso8601String()
            : updatedAt!.toIso8601String(),
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
