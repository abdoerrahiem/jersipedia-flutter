part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddCart extends CartEvent {
  final AddCartModel data;
  const AddCart(this.data);

  @override
  List<Object> get props => [data];
}

class GetMyCart extends CartEvent {}

class RemoveMyCart extends CartEvent {
  final String id;
  const RemoveMyCart(this.id);

  @override
  List<Object> get props => [id];
}
