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
