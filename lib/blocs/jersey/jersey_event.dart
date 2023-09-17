part of 'jersey_bloc.dart';

sealed class JerseyEvent extends Equatable {
  const JerseyEvent();

  @override
  List<Object> get props => [];
}

class GetHomeJersey extends JerseyEvent {}

class GetJersey extends JerseyEvent {
  final String title;
  final num page;
  final num size;
  final String league;
  const GetJersey({
    required this.title,
    required this.page,
    required this.size,
    required this.league,
  });

  @override
  List<Object> get props => [title, page, size, league];
}

class ChangeJerseySearchText extends JerseyEvent {
  final String text;
  const ChangeJerseySearchText(this.text);

  @override
  List<Object> get props => [text];
}

class ChangeJerseySearchByLeague extends JerseyEvent {
  final String id;
  final String name;
  const ChangeJerseySearchByLeague(this.id, this.name);

  @override
  List<Object> get props => [id, name];
}
