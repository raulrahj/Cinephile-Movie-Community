part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object> get props => [];
}

class UserStateInitial extends UserState {}

class UserLoadingState extends UserState {}

// ignore: must_be_immutable
class UserLoadedState extends UserState {
  final UserModel? userData;
  final bool? isProfile;
  bool? isFollowing = false;

  UserLoadedState({this.isProfile, this.userData, this.isFollowing});
}

class UserErrorState extends UserState {}

class CurrentUserState extends UserState {
  final ProfileModel? profileData;
  final bool? isProfile;
  final List<Post>? timeLinePosts;

  const CurrentUserState(
      {this.isProfile, this.profileData, this.timeLinePosts});
}

class UserActionState extends UserState {}
