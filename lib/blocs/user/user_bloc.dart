import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jersipedia/models/login_model.dart';
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
    });
  }
}
