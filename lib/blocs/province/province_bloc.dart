import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jersipedia/models/province_model.dart';
import 'package:jersipedia/services/province_service.dart';

part 'province_event.dart';
part 'province_state.dart';

class ProvinceBloc extends Bloc<ProvinceEvent, ProvinceState> {
  ProvinceBloc() : super(ProvinceInitial()) {
    on<ProvinceEvent>((event, emit) async {
      if (event is GetProvince) {
        try {
          emit(ProvinceLoading());
          final List<ProvinceModel> province =
              await ProvinceService().getProvince();
          emit(ProvinceSuccess(province));
        } catch (e) {
          emit(ProvinceFailed(e.toString()));
        }
      }
    });
  }
}
