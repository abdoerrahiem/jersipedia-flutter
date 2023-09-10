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