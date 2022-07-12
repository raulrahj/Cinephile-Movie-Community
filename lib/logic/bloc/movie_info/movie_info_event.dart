part of 'movie_info_bloc.dart';

@freezed
class MovieInfoEvent with _$MovieInfoEvent{
  const factory MovieInfoEvent.getTrending() = _GetTrending;
  const factory MovieInfoEvent.getNewReleased() = _GetNewReleased;

}  
// @freezed
// class MovieInfoEvent with _$MovieInfoEventEvent {
//   const factory MovieInfoEventEvent.getNewReleased() = _GetNewReleased;
// }