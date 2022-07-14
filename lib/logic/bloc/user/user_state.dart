part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object> get props => [];
}

class UserStateInitial extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final UserModel? userData;
  final bool? isProfile;

  const UserLoadedState({this.isProfile, this.userData});
}

class UserErrorState extends UserState {}

class CurrentUserState extends UserState {
  final ProfileModel? profileData;
  final bool? isProfile;

  const CurrentUserState({this.isProfile, this.profileData});
}
