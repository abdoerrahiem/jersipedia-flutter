part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserFailed extends UserState {
  final String e;
  const UserFailed(this.e);

  @override
  List<Object> get props => [e];
}

class UserSuccess extends UserState {
  final String token;
  const UserSuccess(this.token);

  @override
  List<Object> get props => [token];
}

class CurrentUserLoading extends UserState {}

class CurrentUserFailed extends UserState {
  final String e;
  const CurrentUserFailed(this.e);

  @override
  List<Object> get props => [e];
}

class CurrentUserSuccess extends UserState {
  final UserModel user;
  const CurrentUserSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class UpdateProfileLoading extends UserState {}

class UpdateProfileFailed extends UserState {
  final String e;
  const UpdateProfileFailed(this.e);

  @override
  List<Object> get props => [e];
}

class UpdateProfileSuccess extends UserState {
  final String message;
  const UpdateProfileSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class UpdatePhotoProfileLoading extends UserState {}

class UpdatePhotoProfileFailed extends UserState {
  final String e;
  const UpdatePhotoProfileFailed(this.e);

  @override
  List<Object> get props => [e];
}

class UpdatePhotoProfileSuccess extends UserState {
  final String message;
  const UpdatePhotoProfileSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class UpdatePasswordLoading extends UserState {}

class UpdatePasswordFailed extends UserState {
  final String e;
  const UpdatePasswordFailed(this.e);

  @override
  List<Object> get props => [e];
}

class UpdatePasswordSuccess extends UserState {
  final String message;
  const UpdatePasswordSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class RegisterUserLoading extends UserState {}

class RegisterUserFailed extends UserState {
  final String e;
  const RegisterUserFailed(this.e);

  @override
  List<Object> get props => [e];
}

class RegisterUserSuccess extends UserState {
  final String message;
  const RegisterUserSuccess(this.message);

  @override
  List<Object> get props => [message];
}
