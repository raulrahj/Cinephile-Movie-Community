part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
  @override
  List<Object?> get props => [];
}

class LoadUserEvent extends UserEvent {
  final String userId;

  const LoadUserEvent({required this.userId});
}

class LoadCurrentUser extends UserEvent {
  
}

class UpdateUserEvent extends UserEvent {
  final String id;
  final UserResp userData;
  const UpdateUserEvent({required this.id, required this.userData});
}
