import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jersipedia/models/league_model.dart';
import 'package:jersipedia/services/league_service.dart';

part 'league_event.dart';
part 'league_state.dart';

class LeagueBloc extends Bloc<LeagueEvent, LeagueState> {
  LeagueBloc() : super(LeagueInitial()) {
    on<LeagueEvent>((event, emit) async {
      if (event is GetLeague) {
        try {
          emit(LeagueLoading());
          final List<LeagueModel> data = await LeagueService().getLeague();
          emit(LeagueSuccess(data));
        } catch (e) {
          emit(LeagueFailed(e.toString()));
        }
      }
    });
  }
}
