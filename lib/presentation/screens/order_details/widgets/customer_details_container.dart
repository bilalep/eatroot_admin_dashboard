import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/presentation/screens/order_details/widgets/icon_text_row.dart';
import 'package:tech_test/providers/order_detail_provider.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/text_styles.dart';

class CustomerDetailsContainer extends StatelessWidget {
  const CustomerDetailsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderDetailsProvider>(
      builder: (context, orderDetailProvider, _) {
        final orderDetail = orderDetailProvider.orderDetail;
        return orderDetail == null || orderDetailProvider.loading
            ? const Center(
                child: Text('Error'),
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kColorWhite,
                ),
                width: double.maxFinite,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${orderDetail.customer?.name}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.boldExtraLarge(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    IconTextRow(
                      text: orderDetail.customer?.mobile ?? '',
                      iconData: Icons.phone,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    IconTextRow(
                      text: orderDetail.address?.address?.en ??
                          orderDetail.address?.address?.ar ??
                          '',
                      iconData: Icons.location_on,
                    ),
                  ],
                ),
              );
      },
    );
  }
}
