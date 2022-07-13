import 'package:flutter/material.dart';
import 'package:tech_test/models/order_details/order_detail.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/text_styles.dart';

class OrderBillColumn extends StatelessWidget {
  const OrderBillColumn({
    super.key,
    required this.orderDetail,
  });

  final OrderDetail orderDetail;

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(),
        1: FlexColumnWidth(),
      },
      children: [
        _buildTableRow('Subtotal', orderDetail.actualSubTotal),
        _buildTableRow('VAT', orderDetail.tax),
        _buildTableRow('Delivery Fee', orderDetail.deliveryFee),
        _buildTableRow(
          'Total',
          '${orderDetail.finalAmount} AED',
          valueStyle:
              AppTextStyles.semiBoldExtraLarge(color: kColorPrimaryPink),
        ),
      ],
    );
  }

  TableRow _buildTableRow(
    String? title,
    String? value, {
    TextStyle? valueStyle,
  }) {
    return TableRow(
      children: [
        SizedBox(
          height: 33,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? '',
                style: AppTextStyles.mediumLarge(
                  color: kColorBlack.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 33,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value ?? '-',
                style: valueStyle ?? AppTextStyles.semiBoldLarge(),
                textAlign: TextAlign.end,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
