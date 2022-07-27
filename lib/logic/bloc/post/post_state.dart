// import 'package:equatable/equatable.dart';
part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();
  @override
  List<Object?> get props => [];
}

class PostStateInitial extends PostState {}

class PostErrorState extends PostState {}

class PostLoading extends PostState {
  final ProfileModel currentUser;

  const PostLoading({required this.currentUser});
}

class AllPostState extends PostState {
  final List<Post?>? listPost;

  const AllPostState({this.listPost});
}

class TimeLinePostState extends PostState {
  final List<Post?>? timelinePosts;
  final Post? postData;
  final bool? isLiked;
  final UserModel? userProfile;
  const TimeLinePostState(
      {this.timelinePosts, this.postData, this.isLiked, this.userProfile});

  TimeLinePostState copyWith(
      {List<Post?>? timelinePosts,
      Post? postData,
      bool? isLiked,
      UserModel? userProfile}) {
    return TimeLinePostState(
        timelinePosts: timelinePosts ?? timelinePosts,
        postData: postData ?? postData,
        isLiked: isLiked ?? isLiked,
        userProfile: userProfile ?? userProfile);
  }
}

class OnPostState extends PostState {
  final Post? postData;
  final bool? isLiked;

  void getUser() async {}

  const OnPostState({this.postData, this.isLiked});

  OnPostState copyWith({Post? postData, bool? isLiked}) {
    return OnPostState(
        postData: postData ?? postData, isLiked: isLiked ?? isLiked);
  }
}
