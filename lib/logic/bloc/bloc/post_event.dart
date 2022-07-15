// import 'package:equatable/equatable.dart';
part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
  @override
  List<Object?> get props => [];
}

class LoadPostEvent extends PostEvent {}

class GetAllPost extends PostEvent {}

class GetPostEvent extends PostEvent {
  final String id;

  const GetPostEvent(this.id);
}

class CreatePostEvent extends PostEvent {
  final Post postData;
  final String id;

  const CreatePostEvent({required this.id, required this.postData});
}

class UpdatePostEvent extends PostEvent {}

class LikePostEvent extends PostEvent {
  final String id;

  const LikePostEvent({required this.id});
}

class UnlikePostEvent extends PostEvent {}

class DeletePostEvent extends PostEvent {}

class CommentPostEvent extends PostEvent {}