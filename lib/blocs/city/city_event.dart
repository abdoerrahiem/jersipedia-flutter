part of 'city_bloc.dart';

sealed class CityEvent extends Equatable {
  const CityEvent();

  @override
  List<Object> get props => [];
}

class GetCity extends CityEvent {
  final String id;
  const GetCity(this.id);

  @override
  List<Object> get props => [id];
}
