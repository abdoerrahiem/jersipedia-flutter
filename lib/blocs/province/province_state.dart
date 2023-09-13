part of 'province_bloc.dart';

sealed class ProvinceState extends Equatable {
  const ProvinceState();

  @override
  List<Object> get props => [];
}

final class ProvinceInitial extends ProvinceState {}

final class ProvinceLoading extends ProvinceState {}

final class ProvinceFailed extends ProvinceState {
  final String e;
  const ProvinceFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class ProvinceSuccess extends ProvinceState {
  final List<ProvinceModel> province;
  const ProvinceSuccess(this.province);

  @override
  List<Object> get props => [province];
}
