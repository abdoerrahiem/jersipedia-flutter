part of 'order_bloc.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

final class CheckOngkirLoading extends OrderState {}

final class CheckOngkirFailed extends OrderState {
  final String e;
  const CheckOngkirFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class CheckOngkirSuccess extends OrderState {
  final OngkirModel data;
  const CheckOngkirSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class AddOrderLoading extends OrderState {}

final class AddOrderFailed extends OrderState {
  final String e;
  const AddOrderFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class AddOrderSuccess extends OrderState {
  final String data;
  const AddOrderSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class GetOrdersLoading extends OrderState {}

final class GetOrdersFailed extends OrderState {
  final String e;
  const GetOrdersFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class GetOrdersSuccess extends OrderState {
  final List<OrderHistoryModel> data;
  const GetOrdersSuccess(this.data);

  @override
  List<Object> get props => [data];
}
