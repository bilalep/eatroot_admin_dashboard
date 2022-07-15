import 'package:flutter/material.dart';
import 'package:tech_test/models/order_details/order_detail.dart';
import 'package:tech_test/presentation/core/widgets/dotted_divider.dart';
import 'package:tech_test/presentation/screens/order_details/widgets/items_expansion_panel_list.dart';
import 'package:tech_test/presentation/screens/order_details/widgets/order_bill_column.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/text_styles.dart';

class ItemDetailsContainer extends StatelessWidget {
  const ItemDetailsContainer({
    super.key,
    required this.orderDetail,
  });

  final OrderDetail orderDetail;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: kColorWhite,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: kColorBlack.withOpacity(0.2),
            blurRadius: 12,
            // spreadRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              12,
              16,
              0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Items',
                  style: AppTextStyles.mediumMedium(
                    color: kColorBlack.withOpacity(0.7),
                  ),
                ),
                Text(
                  'Price',
                  style: AppTextStyles.mediumMedium(
                    color: kColorBlack.withOpacity(0.7),
                  ),
                )
              ],
            ),
          ),
          ItemsExpansionPanelList(
            orderDetail: orderDetail,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 48, vertical: 12),
            child: DottedDivider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: OrderBillColumn(orderDetail: orderDetail),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
