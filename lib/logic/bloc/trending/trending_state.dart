// import 'package:open_box/data/models/trending/m_trending.dart';
part of 'trending_bloc.dart';

@freezed
class TrendingState with _$TrendingState {
  const factory TrendingState({
    required bool isLoading,
    List<Trending>? trendingData,
    required Option<Either<MainFailure, List<Trending>>> trendingFSOption,
  }) = _TrendingState;
  factory TrendingState.initial() {
    return const TrendingState(
        isLoading: false, trendingData: [], trendingFSOption: None());
  }
}
