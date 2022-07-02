part of 'new_releases_bloc.dart';

@freezed
class NewReleasesState with _$NewReleasesState {
const factory NewReleasesState({
  required bool isLoading,
  List<NewReleaseResults>? newReleaseData,
  required Option<Either<MainFailure, List<NewReleaseResults>>> newReleaseOption,
}) = _NewReleaseState;

   factory NewReleasesState.initial() {
    return const NewReleasesState(isLoading: false, newReleaseOption: None(),newReleaseData: []);
   }
}
