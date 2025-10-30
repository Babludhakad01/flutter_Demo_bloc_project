import 'package:bloc_project/data/models/get_product_model.dart';
import 'package:bloc_project/data/models/my_order_model.dart';
import 'package:equatable/equatable.dart';

abstract class MyOrderEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddOrderProduct extends MyOrderEvent {
  final List<Product> orderProduct;

  AddOrderProduct(this.orderProduct);

  @override
  List<Object?> get props => [orderProduct];
}


class RemoveProductFromOrder extends MyOrderEvent{
  final String productId;

  RemoveProductFromOrder(this.productId);

  @override
  // TODO: implement props
  List<Object?> get props => [productId];
}


class CancelProductReason extends MyOrderEvent{
final String productId;
final String reason;

CancelProductReason({required this.productId, required this.reason});

@override
  // TODO: implement props
  List<Object?> get props => [productId,reason];
}