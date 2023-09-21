import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jersipedia/models/add_order_model.dart';
import 'package:jersipedia/models/check_ongkir_model.dart';
import 'package:jersipedia/models/ongkir_model.dart';
import 'package:jersipedia/models/order_history_model.dart';
import 'package:jersipedia/services/order_service.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<OrderEvent>((event, emit) async {
      if (event is CheckOngkir) {
        try {
          emit(CheckOngkirLoading());
          final OngkirModel data = await OrderService().checkOngkir(event.data);
          emit(CheckOngkirSuccess(data));
        } catch (e) {
          emit(CheckOngkirFailed(e.toString()));
        }
      }

      if (event is GetOrders) {
        try {
          emit(GetOrdersLoading());
          final List<OrderHistoryModel> data = await OrderService().getOrders();
          emit(GetOrdersSuccess(data));
        } catch (e) {
          emit(GetOrdersFailed(e.toString()));
        }
      }
    });
  }
}

class AddOrderBloc extends Bloc<OrderEvent, OrderState> {
  AddOrderBloc() : super(OrderInitial()) {
    on<OrderEvent>((event, emit) async {
      if (event is AddOrder) {
        try {
          emit(AddOrderLoading());
          final String data = await OrderService().addOrder(event.data);
          emit(AddOrderSuccess(data));
        } catch (e) {
          emit(AddOrderFailed(e.toString()));
        }
      }
    });
  }
}
