part of 'city_bloc.dart';

sealed class CityState extends Equatable {
  const CityState();

  @override
  List<Object> get props => [];
}

final class CityInitial extends CityState {}

final class CityLoading extends CityState {}

final class CityFailed extends CityState {
  final String e;
  const CityFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class CitySuccess extends CityState {
  final List<CityModel> city;
  const CitySuccess(this.city);

  @override
  List<Object> get props => [city];
}
