import 'package:bloc/bloc.dart';
import 'package:bloc_project/data/models/my_order_model.dart';
import 'package:bloc_project/logic/my_order/my_order_event.dart';
import 'package:bloc_project/logic/my_order/my_order_state.dart';

class MyOrderBloc extends Bloc<MyOrderEvent, MyOrderState> {
  MyOrderBloc() : super(MyOrderState()) {
    on<AddOrderProduct>(_onAddOrderProduct);
    on<RemoveProductFromOrder>(_onRemoveProductFromOrder);
    on<CancelProductReason>(_cancelProducts);
  }

  void _onAddOrderProduct(AddOrderProduct event, Emitter<MyOrderState> emit) {
    final orderedList = event.orderProduct.map((product) {
      return MyOrder(
        id: DateTime.now().toString(),
        // product.id
        title: product.title,
        image: product.image,
        status: "Pending",
        price: product.price,
        date: DateTime.now(),
      );
    }).toList();

    final updatedList = [...state.orderItems, ...orderedList];
    emit(state.copyWith(orderItems: updatedList));

    // final updatedList = List<MyOrder>.from(state.orderItems)..addAll(event.orderProduct);
    //  emit(state.copyWith(orderItems: updatedList));
  }

  void _onRemoveProductFromOrder(
    RemoveProductFromOrder event,
    Emitter<MyOrderState> emit,
  ) {
    final updatedItems = state.orderItems
        .where((item) => item.id != event.productId)
        .toList();
    emit(MyOrderState(orderItems: updatedItems));
  }

  void _cancelProducts(CancelProductReason event, Emitter<MyOrderState> emit) {
    final updatedOrder = state.orderItems.map((order) {
      if (order.id == event.productId) {
        return order.copyWith(reason: event.reason, status: "Cancelled");
      }
      return order;
    }).toList();
    print("updatedorder $updatedOrder");

    emit(state.copyWith(orderItems: updatedOrder));
  }
}
