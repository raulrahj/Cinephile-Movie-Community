import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_box/infrastructure/post/postes.dart';

import '../../../data/models/post/m_post.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepo _postRepo;
  PostBloc(this._postRepo) : super(PostStateInitial()) {
    on<GetAllPost>((event, emit) async {
      emit(PostLoading());
      final data = await _postRepo.allPost();
      if (data == null) {
        emit(PostErrorState());
      } else {
        emit(
          AllPostState(listPost: data),
        );
        // emit(const OnPostState());
      }
    });
    on<GetPostEvent>((event, emit) async {
      emit(PostLoading());
      final data = await _postRepo.getPost(id: event.id);
      if (data == null) {
        emit(PostErrorState());
      } else {
        emit(OnPostState(postData: data));
      }
    });
    on<CreatePostEvent>((event, emit) async {
      emit(PostLoading());
      final data =
          await _postRepo.createPost(postDat: event.postData, id: event.id);
      if (data == null) {
        emit(PostErrorState());
      } else {
        emit(OnPostState(postData: data));
      }
    });
    on<LikePostEvent>((event, emit) async {
      final response = await _postRepo.likePost(id: event.id);
      if (response!.statusCode == 200 || response.statusCode == 201) {
        emit(const OnPostState(isLiked: true));
      } else {
        emit(PostErrorState());
      }
    });
    on<CommentPostEvent>((event, emit) async {
      emit(PostLoading());
      final response = await _postRepo.addComment(event.commentData);
      if (response != null) {
        emit(const OnPostState());
      }
    });

    on<DeletePostEvent>((event, emit) async {
      final response = await _postRepo.deletePost(id: event.postId);
      if (response != null) {
        emit(const AllPostState());
      } else {
        print("null");
      }
    });
        on<UpdatePostEvent>((event, emit) async {
      final response = await _postRepo.updatePost(postId: event.postId,postData: event.postData);
      if (response != null) {
        emit(const AllPostState());
      } else {
        print("null");
      }
    });
    
  }
}
