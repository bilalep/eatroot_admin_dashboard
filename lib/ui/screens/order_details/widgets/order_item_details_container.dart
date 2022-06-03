import 'package:flutter/material.dart';
import 'package:tech_test/models/order_details/order_detail.dart';
import 'package:tech_test/ui/core/widgets/order_type_icon.dart';
import 'package:tech_test/ui/screens/order_details/widgets/item_tile_widget.dart';
import 'package:tech_test/utils/constants.dart';

class OrderItemDetailsContainer extends StatelessWidget {
  const OrderItemDetailsContainer({
    super.key,
    required this.orderDetail,
  });

  final OrderDetail orderDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Order #${orderDetail.id ?? ''}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(orderDetail.orderedAt ?? ''),
                  ],
                ),
                OrderTypeIcon(orderingMethod: orderDetail.orderingService),
              ],
            ),
          ),
          kDivider,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (_, index) {
                if (orderDetail.items == null) {
                  return const SizedBox();
                }
                return ItemTileWidget(
                  orderItem: orderDetail.items![index],
                );
              },
              separatorBuilder: (_, index) => const SizedBox(height: 12),
              itemCount: orderDetail.items!.length,
            ),
          ),
          // const SizedBox(height: 10.0),
          kDivider,
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'x${orderDetail.totalItems ?? ''} items',
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${orderDetail.amountToPay ?? ''} AED',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(orderDetail.paymentMethod ?? ''),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
