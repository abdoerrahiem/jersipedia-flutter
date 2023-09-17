part of 'league_bloc.dart';

sealed class LeagueState extends Equatable {
  const LeagueState();

  @override
  List<Object> get props => [];
}

final class LeagueInitial extends LeagueState {}

final class LeagueLoading extends LeagueState {}

final class LeagueFailed extends LeagueState {
  final String e;
  const LeagueFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class LeagueSuccess extends LeagueState {
  final List<LeagueModel> data;
  const LeagueSuccess(this.data);

  @override
  List<Object> get props => [data];
}
