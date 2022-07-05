import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tech_test/models/order_details/order_detail.dart';
import 'package:tech_test/presentation/core/widgets/rounded_text_box_medium.dart';
import 'package:tech_test/providers/order_detail_provider.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/order_status.dart';

class OrderStatusModifierWidget extends StatelessWidget {
  const OrderStatusModifierWidget({
    super.key,
  });

  Widget buildCancelButton(BuildContext context, int orderId) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        textStyle: const TextStyle(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () => Provider.of<OrderDetailsProvider>(context, listen: false)
          .cancelOrder(context, orderId),
      child: const Text('Cancel'),
    );
  }

  Widget buildAcceptButton(
    BuildContext context,
    int orderId,
    String orderType,
  ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: kColorGreen,
        textStyle: const TextStyle(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        if (orderType == 'Delivery') {
          Provider.of<OrderDetailsProvider>(context, listen: false)
              .changeOrderStatusBy1(
            context,
            OrderStatus.deliveryPlaced,
            orderId,
          );
        } else if (orderType == 'Pickup') {
          Provider.of<OrderDetailsProvider>(context, listen: false)
              .changeOrderStatusBy1(
            context,
            OrderStatus.pickupPlaced,
            orderId,
          );
        }
      },
      child: const Text('Accept'),
    );
  }

  Widget buildReadyButton(BuildContext context, int orderId, String orderType) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: kColorBlue,
        textStyle: const TextStyle(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        if (orderType == 'Delivery') {
          Provider.of<OrderDetailsProvider>(context, listen: false)
              .changeOrderStatusBy1(
            context,
            OrderStatus.deliveryAccepted,
            orderId,
          );
        } else if (orderType == 'Pickup') {
          Provider.of<OrderDetailsProvider>(context, listen: false)
              .changeOrderStatusBy1(
            context,
            OrderStatus.pickupAccepted,
            orderId,
          );
        }
      },
      child: const Text('Ready'),
    );
  }

  Widget buildInRouteButton(BuildContext context, int orderId) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: kColorBlue,
        textStyle: const TextStyle(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        Provider.of<OrderDetailsProvider>(context, listen: false)
            .changeOrderStatusBy1(
          context,
          OrderStatus.deliveryReady,
          orderId,
        );
      },
      child: const Text('In Route'),
    );
  }

  Widget buildCompletedButton(
    BuildContext context,
    int orderId,
    String orderType,
  ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: kColorGreen,
        textStyle: const TextStyle(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        if (orderType == 'Delivery') {
          Provider.of<OrderDetailsProvider>(context, listen: false)
              .changeOrderStatusBy1(
            context,
            OrderStatus.deliveryInRoute,
            orderId,
          );
        } else if (orderType == 'Pickup') {
          Provider.of<OrderDetailsProvider>(context, listen: false)
              .changeOrderStatusBy1(
            context,
            OrderStatus.pickupReady,
            orderId,
          );
        }
      },
      child: const Text('Completed'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Consumer<OrderDetailsProvider>(
        builder: (context, orderDetailsProvider, _) {
          final currentStatusId =
              orderDetailsProvider.orderDetail!.statusHistory!.last.statusId!;
          print(
            'currentStatusID ${orderDetailsProvider.orderDetail!.statusHistory!.last.statusId}',
          );
          final orderDetail = orderDetailsProvider.orderDetail!;
          if (orderDetailsProvider.loading) {
            return const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                backgroundColor: Colors.black,
                color: Colors.white,
                strokeWidth: 3,
              ),
            );
          } else {
            if (currentStatusId == OrderStatus.deliveryPlaced ||
                currentStatusId == OrderStatus.pickupPlaced) {
              return buildAcceptButtonRow(context, orderDetail);
            } else if (currentStatusId == OrderStatus.deliveryAccepted ||
                currentStatusId == OrderStatus.pickupAccepted) {
              return buildReadyButtonRow(context, orderDetail);
            } else if (currentStatusId == OrderStatus.deliveryReady) {
              return buildInRouteButtonRow(context, orderDetail);
            } else if (currentStatusId == OrderStatus.deliveryInRoute ||
                currentStatusId == OrderStatus.pickupReady) {
              return buildCompletedButtonRow(context, orderDetail);
            } else if (currentStatusId == OrderStatus.deliveryCompleted ||
                currentStatusId == OrderStatus.pickupCompleted) {
              return const RoundedTextBoxMedium(
                text: 'Order Fulfilled',
                color: kColorGreen,
              );
            } else if (currentStatusId == OrderStatus.cancelled) {
              return RoundedTextBoxMedium(
                text: 'Order Cancelled',
                color: Colors.red.shade400,
              );
            } else {
              return const Text('Unknown');
            }
          }
        },
      ),
    );
  }

  Row buildInRouteButtonRow(BuildContext context, OrderDetail orderDetail) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: buildInRouteButton(
            context,
            orderDetail.id!,
          ),
        ),
      ],
    );
  }

  Row buildCompletedButtonRow(BuildContext context, OrderDetail orderDetail) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: buildCompletedButton(
            context,
            orderDetail.id!,
            orderDetail.orderingService!,
          ),
        ),
      ],
    );
  }

  Row buildReadyButtonRow(BuildContext context, OrderDetail orderDetail) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: buildReadyButton(
            context,
            orderDetail.id!,
            orderDetail.orderingService!,
          ),
        ),
      ],
    );
  }

  Row buildAcceptButtonRow(BuildContext context, OrderDetail orderDetail) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: buildCancelButton(context, orderDetail.id!),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: buildAcceptButton(
            context,
            orderDetail.id!,
            orderDetail.orderingService!,
          ),
        ),
      ],
    );
  }
}
