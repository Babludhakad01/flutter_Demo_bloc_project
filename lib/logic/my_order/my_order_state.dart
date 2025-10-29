import 'package:bloc_project/data/models/my_order_model.dart';
import 'package:equatable/equatable.dart';

class MyOrderState extends Equatable{
  final List<MyOrder> orderItems;

  const MyOrderState({this.orderItems = const []});


  MyOrderState copyWith({List<MyOrder>? orderItems}){
    return MyOrderState(orderItems: orderItems?? this.orderItems);
  }

  @override

  List<Object?> get props => [orderItems];
}