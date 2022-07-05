import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/models/order_list/order.dart';
import 'package:tech_test/presentation/core/widgets/rounded_text_box_small.dart';
import 'package:tech_test/presentation/screens/order_details/order_details_screen.dart';
import 'package:tech_test/providers/order_detail_provider.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/extensions.dart';
import 'package:tech_test/utils/text_styles.dart';

class LiveOrderListTile extends StatelessWidget {
  const LiveOrderListTile({
    super.key,
    required this.orderList,
    required this.index,
  });

  final int index;
  final List<Order> orderList;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () async {
          if (orderList[index].id != null) {
            final navigator = Navigator.of(context);
            unawaited(
              Provider.of<OrderDetailsProvider>(context, listen: false)
                  .getOrderDetailsFromId(orderList[index].id!),
            );
            await navigator.pushNamed(OrderDetailsScreen.routeName);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '#${orderList[index].orderNo ?? '-'}',
                    style: kTSOrderTileTitle1,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    orderList[index].channel?.trim() ?? '-',
                    style: kTSOrderTileSubTitleSemiTrans,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    orderList[index].orderAt?.trim() ?? '-',
                    style: kTSOrderTileSubTitleSemiTrans,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'AED ${orderList[index].actualSubTotal}',
                    style: kTSOrderTileTitle1,
                  ),
                  const SizedBox(height: 4),
                  RoundedTextBoxSmall(
                    text: orderList[index].paymentMethod ?? '-',
                    color: kColorYellow,
                  ),
                  const SizedBox(height: 4),
                  RoundedTextBoxSmall(
                    color: kColorPrimaryPink,
                    text: orderList[index].status?.capitalize() ?? '-',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
