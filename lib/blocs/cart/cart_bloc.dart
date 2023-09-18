import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jersipedia/models/add_cart_model.dart';
import 'package:jersipedia/models/cart_model.dart';
import 'package:jersipedia/services/cart_service.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) async {
      if (event is AddCart) {
        try {
          emit(AddCartLoading());
          final String message = await CartService().addCart(event.data);
          emit(AddCartSuccess(message));
        } catch (e) {
          emit(AddCartFailed(e.toString()));
        }
      }

      if (event is GetMyCart) {
        try {
          emit(GetMyCartLoading());
          final List<CartModel> data = await CartService().getMyCart();
          emit(GetMyCartSuccess(data));
        } catch (e) {
          emit(GetMyCartFailed(e.toString()));
        }
      }

      if (event is RemoveMyCart) {
        try {
          emit(RemoveMyCartLoading());
          final String message = await CartService().removeMyCart(event.id);
          emit(RemoveMyCartSuccess(message));
        } catch (e) {
          emit(RemoveMyCartFailed(e.toString()));
        }
      }
    });
  }
}
