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

  const GetPostEvent({required this.id});
}

class CreatePostEvent extends PostEvent {
  final Post postData;
  final String id;

  const CreatePostEvent({required this.id, required this.postData});
}

class UpdatePostEvent extends PostEvent {
  final String postId;
  final Post postData;
  const UpdatePostEvent({required this.postData, required this.postId});
}

class LikePostEvent extends PostEvent {
  final String id;

  const LikePostEvent({required this.id});
}

// class UnlikePostEvent extends PostEvent {}

class DeletePostEvent extends PostEvent {
  final String postId;

  const DeletePostEvent({required this.postId});
}

class CommentPostEvent extends PostEvent {
  final Comment commentData;
  const CommentPostEvent({required this.commentData});
}
