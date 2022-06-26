

class User{
  
}



class UserData {
  final String userName;
  final String password;
  final String firstName;
  final String? lastName;
  final String? profilePic;
  final String? coverPic;
  final String? about;
  final String? livesIn;
  final String? worksAt;
  final String? relationship;
  final bool? isAdmin;
  final List<UserData>? following;
  final List<UserData>? followers;

  UserData(
      {required this.userName,
      required this.password,
      required this.firstName,
      this.lastName,
      this.profilePic,
      this.coverPic,
      this.about,
      this.livesIn,
      this.worksAt,
      this.relationship,
      this.isAdmin,
      this.following,
      this.followers});

  static UserData fromJson(Map<String, dynamic> json) => UserData(
        userName: json['userName'],
        password: json['password'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        profilePic: json['profilePicture'],
        coverPic: json['coverPicture'],
        about: json['about'],
        livesIn: json['livesIn'],
        worksAt: json['workAt'],
        relationship: json['relationShip'],
        isAdmin: json['isAdmin'],
        followers: json['followers'],
        following: json['following'],
      );
  Map<String, dynamic> toJson() => {
        'userName': UserData,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
        'profilePicture': profilePic,
        'coverPicture': coverPic,
        'about': about,
        'livesIn': livesIn,
        'workAt': worksAt,
        'relationShip': relationship,
        'isAdmin': isAdmin,
        'following': following,
        'followers': followers,
      };
}
