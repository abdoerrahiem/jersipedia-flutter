import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jersipedia/models/jersey_model.dart';
import 'package:jersipedia/services/jersey_service.dart';

part 'jersey_event.dart';
part 'jersey_state.dart';

class JerseyHomeBloc extends Bloc<JerseyEvent, JerseyState> {
  JerseyHomeBloc() : super(JerseyInitial()) {
    on<JerseyEvent>((event, emit) async {
      if (event is GetHomeJersey) {
        try {
          emit(HomeJerseyLoading());
          final List<JerseyModel> data = await JerseyService().getHomeJersey();
          emit(HomeJerseySuccess(data));
        } catch (e) {
          emit(HomeJerseyFailed(e.toString()));
        }
      }
    });
  }
}

class JerseyBloc extends Bloc<JerseyEvent, JerseyState> {
  JerseyBloc() : super(JerseyInitial()) {
    on<JerseyEvent>((event, emit) async {
      if (event is GetJersey) {
        try {
          emit(JerseyLoading());
          final List<JerseyModel> data = await JerseyService().getJersey(
            title: event.title,
            page: event.page,
            size: event.size,
            league: event.league,
          );
          emit(JerseySuccess(data));
        } catch (e) {
          emit(JerseyFailed(e.toString()));
        }
      }
    });
  }
}

class JerseySearchBloc extends Bloc<JerseyEvent, JerseyState> {
  JerseySearchBloc() : super(JerseyInitial()) {
    on<JerseyEvent>((event, emit) async {
      if (event is ChangeJerseySearchText) {
        emit(JerseySearchText(event.text));
      }
    });
  }
}

class JerseySearchByLeagueBloc extends Bloc<JerseyEvent, JerseyState> {
  JerseySearchByLeagueBloc() : super(JerseyInitial()) {
    on<JerseyEvent>((event, emit) async {
      if (event is ChangeJerseySearchByLeague) {
        emit(JerseySearchByLeague(event.id, event.name));
      }
    });
  }
}
