import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/order_detail_provider.dart';
import '../../../../utils/order_status.dart';

class OrderStatusModifierWidget extends StatelessWidget {
  const OrderStatusModifierWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<OrderDetailsProvider>(
          builder: (context, orderDetails, _) {
            final currentStatusId =
                orderDetails.orderDetail!.statusHistory!.last.statusId!;
            final orderStatus = OrderStatus(currentStatusId);
            return orderDetails.loading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.black,
                      color: Colors.white,
                      strokeWidth: 3,
                    ),
                  )
                : Column(
                    children: [
                      Text(orderStatus.getStatusDescription(),
                          style: Theme.of(context).textTheme.headline2),
                      const SizedBox(height: 10.0),
                      currentStatusId == 10
                          ? const SizedBox()
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                              ),
                              child: Text(
                                orderStatus.getButtonText(),
                              ),
                              onPressed: () async {
                                if (currentStatusId == 5 ||
                                    currentStatusId == 9 ||
                                    currentStatusId == 10) {
                                  Navigator.of(context).pop();
                                }
                                await orderDetails.changeOrderStatusBy1(
                                    context,
                                    currentStatusId,
                                    orderDetails.orderDetail!.id!);
                              },
                            ),
                      currentStatusId == 1 || currentStatusId == 6
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                              ),
                              child: const Text('Cancel Order'),
                              onPressed: () async {
                                final nav = Navigator.of(context);
                                await orderDetails.cancelOrder(
                                    context, orderDetails.orderDetail!.id!);
                                nav.pop();
                              },
                            )
                          : const SizedBox(),
                    ],
                  );
          },
        ),
      ],
    );
  }
}
