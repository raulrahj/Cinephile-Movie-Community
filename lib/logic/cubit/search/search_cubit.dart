import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:open_box/data/core/api_end_points.dart';
import 'package:open_box/data/models/search/m_review.dart';
import 'package:open_box/data/models/search/m_search.dart';
import 'package:open_box/data/models/user/m_user.dart';
import 'package:open_box/data/util/dio_client.dart';
import 'package:open_box/infrastructure/search/search_repo.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState.initial());

  Future searchUser({required String searchQuery}) async {
    final List<UserModel>? usersList = await SearchRepo().getAllUser();

    final List<UserModel> searchResult = usersList!
        .where((element) =>
            element.firstname.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
    if (searchQuery == '') {
      emit(state.copyWith(userList: []));
    } else {
      emit(state.copyWith(userList: searchResult));
    }
  }

  Future searchMovie({required String movieQuery}) async {
    String searchUrl =
        "${ApiEndPoints.movieSearch}/$movieQuery&page=1&include_adult=false";
    final response = await DioClient().get(searchUrl, movieQuery);
    final res = jsonEncode(response);
    final SearchMovie data = searchMovieFromJson(res);
    final movieResult = data.results;
    if (movieQuery == '') {
      emit(state.copyWith(movieList: []));
    } else {
      emit(state.copyWith(movieList: movieResult!));
    }
  }

  Future<List<ReviewResult>>? getReview({required int movieId}) async {
    List<ReviewResult>? reviewList;
    String reviewUrl =
        "https://api.themoviedb.org/3/movie/$movieId/reviews?api_key=b6feeb28b2559dccfecfb79215695a4b&language=en-US&page=1";
    try {
      print("in try...");
      final response = await DioClient().get(reviewUrl, '');
      final res = jsonEncode(response);
      final MovieReviewModel list = movieReviewModelFromJson(res);
      reviewList = list.results;
      emit(state.copyWith(reviewList: reviewList!));
    } catch (e) {
      print(e.toString());
    }

    return reviewList!;
  }
}
