import 'package:flutter/material.dart';
import 'package:tech_test/models/order_details/order_detail.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/extensions.dart';
import 'package:tech_test/utils/text_styles.dart';

class CurrentStatusDisplay extends StatelessWidget {
  const CurrentStatusDisplay({
    super.key,
    required this.orderDetail,
  });

  final OrderDetail? orderDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        Text(
          'Order Status',
          style: kTSOrderDetailScreenTitle1,
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: kColorOrderTileBG,
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                  color: kColorPrimaryPink,
                ),
                child: Image.asset(
                  'assets/icon/order_placed.png',
                  height: 20,
                  width: 20,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                orderDetail!.status!.capitalize(),
                style: kTSOrderDetailScreenTitle2,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
