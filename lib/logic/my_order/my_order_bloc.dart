import 'package:bloc/bloc.dart';
import 'package:bloc_project/data/models/my_order_model.dart';
import 'package:bloc_project/logic/my_order/my_order_event.dart';
import 'package:bloc_project/logic/my_order/my_order_state.dart';

class MyOrderBloc extends Bloc<MyOrderEvent, MyOrderState>{

  MyOrderBloc(): super(MyOrderState()){
    on<AddOrderProduct>(_onAddOrderProduct);
    on<RemoveProductFromOrder>(_onRemoveProductFromOrder);
  }

  void _onAddOrderProduct(AddOrderProduct event, Emitter<MyOrderState> emit){
    final updatedList = List<MyOrder>.from(state.orderItems)..addAll(event.orderProduct);
     emit(state.copyWith(orderItems: updatedList));
  }
  void _onRemoveProductFromOrder(RemoveProductFromOrder event, Emitter<MyOrderState> emit){

    final updatedItems = state.orderItems.where((item)=> item.id != event.productId).toList();
    emit(MyOrderState(orderItems: updatedItems));
  }

}