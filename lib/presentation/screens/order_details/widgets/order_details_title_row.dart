import 'package:flutter/material.dart';
import 'package:tech_test/models/order_details/order_detail.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/text_styles.dart';

const backButtonSize = 28.0;

class OrderDetailsTitleRow extends StatelessWidget {
  const OrderDetailsTitleRow({
    super.key,
    required this.orderDetail,
  });

  final OrderDetail orderDetail;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          iconSize: backButtonSize,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kColorWhite,
          ),
        ),
        Text(
          'Order #${orderDetail.orderNo}',
          style: kTSOrderDetailScreenAppBarTitle,
        ),
        const SizedBox(
          width: backButtonSize + 16,
        )
      ],
    );
  }
}
