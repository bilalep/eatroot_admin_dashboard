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
    return Container(
      decoration: const BoxDecoration(
        color: kColorWhite,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              8,
              16,
              0,
            ),
            child: Text(
              'Items',
              style: kTSOrderDetailScreenTitle1,
            ),
          ),
          ItemsExpansionPanelList(
            orderDetail: orderDetail,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
            child: DottedDivider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: OrderBillColumn(orderDetail: orderDetail),
          ),
          const SizedBox(
            width: 16,
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
