import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jersipedia/models/city_model.dart';
import 'package:jersipedia/services/city_service.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc() : super(CityInitial()) {
    on<CityEvent>((event, emit) async {
      if (event is GetCity) {
        try {
          emit(CityLoading());
          final List<CityModel> city =
              await CityService().getProvince(event.id);
          emit(CitySuccess(city));
        } catch (e) {
          emit(CityFailed(e.toString()));
        }
      }
    });
  }
}
