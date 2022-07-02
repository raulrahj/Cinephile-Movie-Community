import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:open_box/data/core/failures/main_failure.dart';
import 'package:open_box/data/models/new_releases/new_releases.dart';
import 'package:open_box/data/repo/trending_repo.dart';

part 'new_releases_event.dart';
part 'new_releases_state.dart';
part 'new_releases_bloc.freezed.dart';

@injectable
class NewReleasesBloc extends Bloc<NewReleasesEvent, NewReleasesState> {
  final NewReleasesRepo _newReleasesRepo;
  NewReleasesBloc(this._newReleasesRepo) : super(NewReleasesState.initial()) {
    on<_GetNewReleased>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          newReleaseOption: none(),
        ),
      );
      final Either<MainFailure, NewReleases> newReleaseOption = 
      await _newReleasesRepo.getNewReleases();
      emit(newReleaseOption.fold((error) => state.copyWith(isLoading:false,

      newReleaseOption: Some(left(error),
      ),), 
      (completed) => state.copyWith(
        isLoading:false,
        newReleaseData:completed.results,
        newReleaseOption:Some(
          right(completed.results!),),),
          ),
          );
    });
  }
}
