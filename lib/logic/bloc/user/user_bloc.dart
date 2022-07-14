import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_box/data/models/user/m_profile.dart';
import 'package:open_box/data/models/user/m_user.dart';
import 'package:open_box/infrastructure/helper/shared_service.dart';
import 'package:open_box/infrastructure/user/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo _userRepo;

  UserBloc(this._userRepo) : super(UserStateInitial()) {
    on<LoadUserEvent>((event, emit) async {
      // ignore: unnecessary_type_check
      if (event is LoadUserEvent) {
        emit(UserLoadingState());
        final data = await _userRepo.getUser(id: event.userId);
        if (data == null) {
          emit(UserErrorState());
        } else {
          emit(UserLoadedState(userData: data, isProfile: false));
        }
      }
    });

    on<LoadCurrentUser>((event, emit) async {
      emit(UserLoadingState());
      final data = await SharedService.getUserProfile();
      if (data == null) {
        emit(UserErrorState());
      } else {
        emit(CurrentUserState(profileData: data));
      }
    });

    on<UpdateUserEvent>((event, emit) async {
      emit(UserLoadingState());

      final data =
          await _userRepo.updateUser(id: event.id, userData: event.userData);
      if (data == null) {
        emit(UserErrorState());
      } else {
        emit(CurrentUserState(profileData: data, isProfile: true));
      }
    });
  }
}
