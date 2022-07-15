// import 'package:equatable/equatable.dart';
part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();
  @override
  List<Object?> get props => [];
}

class PostStateInitial extends PostState {}

class PostErrorState extends PostState {}

class PostLoading extends PostState {}

class AllPostState extends PostState {
  final List<Post?>? listPost;

  const AllPostState({this.listPost});
}

class TimeLinePostState extends PostState {}

class OnPostState extends PostState {
  final Post? postData;

  const OnPostState({this.postData});
}
