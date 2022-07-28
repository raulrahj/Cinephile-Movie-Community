// import 'package:open_box/data/models/trending/m_trending.dart';
part of 'movie_info_bloc.dart';

@freezed
class MovieInfoState with _$MovieInfoState {
  const factory MovieInfoState({
    required bool isLoading,
    Trending? trendingData,
    NewReleases? newReleaseData,
    required Option<Either<MainFailure, Trending>> trendingFSOption,
    required Option<Either<MainFailure, NewReleases>> newReleaseOption,
  }) = _MovieInfoState;
  factory MovieInfoState.initial() {
    return const MovieInfoState(
        newReleaseOption: None(),
        newReleaseData: null,
        isLoading: false,
        trendingData: null,
        trendingFSOption: None());
  }
}
