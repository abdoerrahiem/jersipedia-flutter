part of 'league_bloc.dart';

sealed class LeagueEvent extends Equatable {
  const LeagueEvent();

  @override
  List<Object> get props => [];
}

class GetLeague extends LeagueEvent {}
