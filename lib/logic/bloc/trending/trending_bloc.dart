import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:open_box/data/core/failures/main_failure.dart';
import 'package:open_box/data/models/trending/m_trending.dart';
import 'package:open_box/data/models/trending/trending_repo.dart';
part 'trending_event.dart';
part 'trending_state.dart';
part 'trending_bloc.freezed.dart';

@injectable
class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final TrendingRepo _trendingRepo;
  TrendingBloc(this._trendingRepo) : super(TrendingState.initial()) {
    on<_GetTrending>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          trendingFSOption: none(),
        ),
      );
      final Either<MainFailure, List<Trending>> trendingOption =
          await _trendingRepo.getTrending();
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
  }
}
