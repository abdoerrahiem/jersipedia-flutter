import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jersipedia/models/login_model.dart';
import 'package:jersipedia/models/update_password_model.dart';
import 'package:jersipedia/models/update_photo_profile_model.dart';
import 'package:jersipedia/models/update_profile_model.dart';
import 'package:jersipedia/models/user_model.dart';
import 'package:jersipedia/services/user_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is UserLogin) {
        try {
          emit(UserLoading());
          final String token = await UserService().login(event.data);
          emit(UserSuccess(token));
        } catch (e) {
          emit(UserFailed(e.toString()));
        }
      }

      if (event is GetCurrentUser) {
        try {
          emit(CurrentUserLoading());
          final UserModel user = await UserService().getCurrentUser();
          emit(CurrentUserSuccess(user));
        } catch (e) {
          emit(CurrentUserFailed(e.toString()));
        }
      }

      if (event is UpdateProfile) {
        try {
          emit(UpdateProfileLoading());
          final String message = await UserService().updateProfile(event.data);
          emit(UpdateProfileSuccess(message));
        } catch (e) {
          emit(UpdateProfileFailed(e.toString()));
        }
      }

      if (event is UpdatePhotoProfile) {
        try {
          emit(UpdatePhotoProfileLoading());
          final String message =
              await UserService().updatePhotoProfile(event.data);
          emit(UpdatePhotoProfileSuccess(message));
        } catch (e) {
          emit(UpdatePhotoProfileFailed(e.toString()));
        }
      }

      if (event is UpdatePassword) {
        try {
          emit(UpdatePasswordLoading());
          final String message = await UserService().updatePassword(event.data);
          emit(UpdatePasswordSuccess(message));
        } catch (e) {
          emit(UpdatePasswordFailed(e.toString()));
        }
      }
    });
  }
}
