part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required List<UserModel> userList,
    required List<SearchResult> movieList,
    required List<ReviewResult> reviewList
  }) = _SearchState;
  factory SearchState.initial() =>
      const SearchState(userList: [], movieList: [],reviewList: []);
}
