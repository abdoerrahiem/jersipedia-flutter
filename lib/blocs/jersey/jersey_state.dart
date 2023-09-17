part of 'jersey_bloc.dart';

sealed class JerseyState extends Equatable {
  const JerseyState();

  @override
  List<Object> get props => [];
}

final class JerseyInitial extends JerseyState {}

final class HomeJerseyLoading extends JerseyState {}

final class HomeJerseyFailed extends JerseyState {
  final String e;
  const HomeJerseyFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class HomeJerseySuccess extends JerseyState {
  final List<JerseyModel> data;
  const HomeJerseySuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class JerseyLoading extends JerseyState {}

final class JerseyFailed extends JerseyState {
  final String e;
  const JerseyFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class JerseySuccess extends JerseyState {
  final List<JerseyModel> data;
  const JerseySuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class JerseySearchText extends JerseyState {
  final String text;
  const JerseySearchText(this.text);

  @override
  List<Object> get props => [text];
}

final class JerseySearchByLeague extends JerseyState {
  final String id;
  final String name;
  const JerseySearchByLeague(this.id, this.name);

  @override
  List<Object> get props => [id, name];
}
