import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/providers/order_detail_provider.dart';

import 'package:tech_test/ui/screens/order_details/widgets/order_item_details_container.dart';
import 'package:tech_test/ui/screens/order_details/widgets/order_status_modifier_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  static const routeName = 'order_details';

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderDetailsProvider>(
      builder: (context, orderDetailProvider, _) {
        final orderDetail = orderDetailProvider.orderDetail;
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Order Details'),
            ),
            body: orderDetail == null || orderDetailProvider.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () => Provider.of<OrderDetailsProvider>(
                      context,
                      listen: false,
                    ).getOrderDetailsFromId(orderDetail.id!),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            orderDetail.customer?.name ?? '',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          if (orderDetail.orderingService == 'Delivery')
                            Text(orderDetail.address?.address ?? '')
                          else
                            Text(
                              'Pickup from: ${orderDetail.address?.addressEn}',
                            ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: OrderItemDetailsContainer(
                              orderDetail: orderDetail,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const OrderStatusModifierWidget(),
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
