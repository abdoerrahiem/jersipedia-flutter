part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserLogin extends UserEvent {
  final LoginModel data;
  const UserLogin(this.data);

  @override
  List<Object> get props => [data];
}

class GetCurrentUser extends UserEvent {}

class UpdateProfile extends UserEvent {
  final UpdateProfileModel data;
  const UpdateProfile(this.data);

  @override
  List<Object> get props => [data];
}

class UpdatePhotoProfile extends UserEvent {
  final UpdatePhotoProfileModel data;
  const UpdatePhotoProfile(this.data);

  @override
  List<Object> get props => [data];
}

class UpdatePassword extends UserEvent {
  final UpdatePasswordModel data;
  const UpdatePassword(this.data);

  @override
  List<Object> get props => [data];
}

class RegisterUser extends UserEvent {
  final RegisterModel data;
  const RegisterUser(this.data);

  @override
  List<Object> get props => [data];
}
