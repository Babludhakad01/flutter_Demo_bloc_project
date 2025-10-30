import 'package:bloc_project/core/colors/colors.dart';
import 'package:bloc_project/core/constants/length.dart';
import 'package:bloc_project/core/constants/string_constants.dart';
import 'package:bloc_project/core/navigation/navigation_service.dart';
import 'package:bloc_project/core/themes/app_text_style.dart';
import 'package:bloc_project/core/widgets/common_widgets.dart';
import 'package:bloc_project/data/models/my_order_model.dart';
import 'package:bloc_project/logic/my_order/my_order_bloc.dart';
import 'package:bloc_project/logic/my_order/my_order_event.dart';
import 'package:bloc_project/logic/my_order/my_order_state.dart';
import 'package:bloc_project/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CancelProductsDetails extends StatefulWidget {
  final MyOrder myOrder;

  const CancelProductsDetails({super.key, required this.myOrder});

  @override
  State<CancelProductsDetails> createState() => _CancelProductsDetailsState();
}

class _CancelProductsDetailsState extends State<CancelProductsDetails> {
  void _showNoteDialog(item) {
    TextEditingController textEditingController = TextEditingController();

    if (item.reason != null && item.reason.isNotEmpty) {
      textEditingController.text = item.reason!;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Enter Feedback",
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),

        content: TextField(
          controller: textEditingController,
          style: TextStyle(color: Colors.white),

          decoration: InputDecoration(
            hintText: "Enter your Reason ",
            hintStyle: TextStyle(color: Colors.white54),

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
          ),

          maxLines: 3,
        ),

        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel", style: TextStyle(color: Colors.redAccent)),
          ),

          ElevatedButton(
            onPressed: () {
              context.read<MyOrderBloc>().add(
                CancelProductReason(
                  productId: item.id,
                  reason: textEditingController.text.trim(),
                ),
              );
              Navigator.pop(context);
              // NavigationService.pushNamed(AppRoutes.cancelledProducts);
            },
            child: Text("Save", style: TextStyle(color: Colors.teal)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrderBloc, MyOrderState>(
      builder: (context, state) {
        final item = state.orderItems.firstWhere(
          (order) => order.id == widget.myOrder.id,
          orElse: () => widget.myOrder,
        );
        // final orders = state.orderItems;
        return Scaffold(
          backgroundColor: AppColors.backGroundColor,
          appBar: CommonWidgets.appBar(title: StringConstants.productDetail),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: CommonWidgets.appIcons(
                        assetName: item.image, // use any demo image constant
                        height: 200.h,
                        width: AppLength.screenWidthPart(1.3),
                        fit: BoxFit.fill,
                      ),
                    ),
                    CommonWidgets.verticalSpace(height: 30.h),
                    Text(item.title, style: AppTextStyle.titleStyle24bw),
                    Text(
                      item.date.toLocal().toString(),
                      style: AppTextStyle.titleStyle16bw,
                    ),
                    CommonWidgets.verticalSpace(height: 10.h),
                    Text(
                      item.price.toString(),
                      style: AppTextStyle.titleStyle16bw,
                    ),
                    CommonWidgets.verticalSpace(height: 20.h),
                    Text(
                      StringConstants.description,
                      style: AppTextStyle.titleStyle16bw,
                    ),
                    CommonWidgets.verticalSpace(height: 10.h),
                    Text(
                      'This is a sample product description. '
                      'It gives details about the product features, specifications, and quality.',
                      style: AppTextStyle.titleStyle14w,
                    ),
                    CommonWidgets.verticalSpace(height: 15.h),
                    Text(
                      StringConstants.reasons,
                      style: AppTextStyle.titleStyle16bw,
                    ),
                    Text(item.reason, style: AppTextStyle.titleStyle14w),
                  ],
                ),
                CommonWidgets.verticalSpace(height: 140.h),
                Container(
                  height: 104.h,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.h),
                    // color: AppColors.backGroundColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CommonWidgets.commonElevatedButton(
                        width: 179.w,
                        height: 46.h,
                        onPressed: () {
                          _showNoteDialog(widget.myOrder);
                        },
                        context: context,
                        child: Text(
                          StringConstants.cancelProducts,
                          style: AppTextStyle.titleStyle20bw,
                        ),
                      ),
                      CommonWidgets.horizontalSpace(width: 15.h),
                      CommonWidgets.commonElevatedButton(
                        width: 135.w,
                        height: 44.h,
                        onPressed: () {
                          NavigationService.pushNamed(
                            AppRoutes.cancelledProducts,
                          );
                        },
                        context: context,
                        child: Text(
                          "Cancel Screen",
                          style: AppTextStyle.titleStyle20bw,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
