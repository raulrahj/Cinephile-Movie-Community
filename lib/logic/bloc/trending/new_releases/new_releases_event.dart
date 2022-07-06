part of 'new_releases_bloc.dart';

@freezed
class NewReleasesEvent with _$NewReleasesEvent {
  const factory NewReleasesEvent.getNewReleased() = _GetNewReleased;
}