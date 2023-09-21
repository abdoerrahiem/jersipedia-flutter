part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class CheckOngkir extends OrderEvent {
  final CheckOngkirModel data;
  const CheckOngkir(this.data);

  @override
  List<Object> get props => [data];
}

class AddOrder extends OrderEvent {
  final AddOrderModel data;
  const AddOrder(this.data);

  @override
  List<Object> get props => [data];
}

class GetOrders extends OrderEvent {}
