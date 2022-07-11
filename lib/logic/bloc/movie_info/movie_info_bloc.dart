// import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:open_box/data/core/failures/main_failure.dart';
import 'package:open_box/data/models/new_releases/new_releases.dart';
import 'package:open_box/data/models/trending/m_trending.dart';
import 'package:open_box/data/repo/trending_repo.dart';
part 'movie_info_event.dart';
part 'movie_info_state.dart';
// part 'trending_bloc.freezed.dart';
part 'movie_info_bloc.freezed.dart';

@injectable
class MovieInfoBloc extends Bloc<MovieInfoEvent, MovieInfoState> {
  final MovieInfoRepo _movieInfoRepo;
  MovieInfoBloc(this._movieInfoRepo) : super(MovieInfoState.initial()) {
    on<_GetTrending>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          trendingFSOption: none(),
        ),
      );
      final Either<MainFailure, Trending> trendingOption =
          await _movieInfoRepo.getTrending();
      emit(
        trendingOption.fold(
          (error) => state.copyWith(
            isLoading: false,
            trendingFSOption: Some(
              left(error),
            ),
          ),
          (completed) => state.copyWith(
            isLoading: false,
            trendingData: completed,
            trendingFSOption: Some(
              right(completed),
            ),
          ),
        ),
      );
    });
    on<_GetNewReleased>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          newReleaseOption: none(),
        ),
      );
      final Either<MainFailure, NewReleases> newReleaseOption =
          await _movieInfoRepo.getNewReleases();
      emit(
        newReleaseOption.fold(
          (error) => state.copyWith(
            isLoading: false,
            newReleaseOption: Some(
              left(error),
            ),
          ),
          (completed) => state.copyWith(
            isLoading: false,
            newReleaseData: completed,
            newReleaseOption: Some(
              right(completed),
            ),
          ),
        ),
      );
    });
  }
}
