part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class AddCartLoading extends CartState {}

final class AddCartFailed extends CartState {
  final String e;
  const AddCartFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class AddCartSuccess extends CartState {
  final String message;
  const AddCartSuccess(this.message);

  @override
  List<Object> get props => [message];
}

final class GetMyCartLoading extends CartState {}

final class GetMyCartFailed extends CartState {
  final String e;
  const GetMyCartFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class GetMyCartSuccess extends CartState {
  final List<CartModel> data;
  const GetMyCartSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class RemoveMyCartLoading extends CartState {}

final class RemoveMyCartFailed extends CartState {
  final String e;
  const RemoveMyCartFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class RemoveMyCartSuccess extends CartState {
  final String message;
  const RemoveMyCartSuccess(this.message);

  @override
  List<Object> get props => [message];
}
