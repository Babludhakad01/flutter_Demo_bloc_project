import 'package:bloc_project/core/colors/colors.dart';
import 'package:bloc_project/core/constants/string_constants.dart';
import 'package:bloc_project/core/navigation/navigation_service.dart';
import 'package:bloc_project/core/widgets/common_widgets.dart';
import 'package:bloc_project/logic/my_order/my_order_bloc.dart';
import 'package:bloc_project/logic/my_order/my_order_event.dart';
import 'package:bloc_project/logic/my_order/my_order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreen();
}

class _OrderScreen extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrderBloc, MyOrderState>(
      builder: (context, state) {
        final orders = state.orderItems;
        print;

        return Scaffold(
          backgroundColor: AppColors.backGroundColor,
          resizeToAvoidBottomInset: false,
          appBar: CommonWidgets.appBar(title: StringConstants.myOrder),

          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final item = orders[index];
                    print(item);

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: const Color(0xFF2B3545),

                      child: ListTile(


                        contentPadding: EdgeInsets.all(8),
                        leading: ClipRect(
                          child: Image.asset(
                            item.image,
                            height: 60,
                            width: 60,
                            fit: BoxFit.contain,
                          ),
                        ),

                        title: Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            item.date.toLocal().toString(),
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        trailing: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,

                          children: [
                            // Icon(
                            //   Icons.local_shipping_rounded,
                            //   color: AppColors.lightWhite,
                            //   size: 22,
                            // ),


                            Text(
                              item.status,
                              style: TextStyle(
                                fontSize: 10,
                                color: AppColors.primary,
                              ),
                            ),
                            SizedBox(width: 4,),
                            item.status == "Pending"
                                ? IconButton(
                                    onPressed: () {
                                      NavigationService.pushNamed("/cancel_product_details");
                                      context.read<MyOrderBloc>().add(RemoveProductFromOrder(item.id));
                                    },
                                    icon: Icon(Icons.cancel, color: Colors.grey,),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
