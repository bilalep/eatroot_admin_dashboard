import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tech_test/models/order_details/order_detail.dart';
import 'package:tech_test/providers/order_detail_provider.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/order_status.dart';
import 'package:tech_test/utils/text_styles.dart';

class OrderStatusModifierWidget extends StatelessWidget {
  const OrderStatusModifierWidget({
    super.key,
  });

  // Widget buildAcceptButton(
  //   BuildContext context,
  //   int orderId,
  //   String orderType,
  // ) {
  //   return ElevatedButton(
  //     style: ElevatedButton.styleFrom(
  //       primary: kColorGreen,
  //       textStyle: const TextStyle(color: kColorWhite),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //     ),
  //     onPressed: ,
  //     child: const Text('Accept'),
  //   );
  // }

  Widget buildInRouteButton(BuildContext context, int orderId) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: kColorBlue,
        textStyle: const TextStyle(color: kColorWhite),
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

  Row buildAcceptButtonRow(BuildContext context, OrderDetail orderDetail) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: StatusModifierButton(
            onPressed: () {
              Provider.of<OrderDetailsProvider>(context, listen: false)
                  .cancelOrder(context, orderDetail.id!);
            },
            buttonText: 'Cancel this order',
            buttonColor: kColorFlatRed,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: StatusModifierButton(
            buttonText: 'Accept this order',
            buttonColor: kColorFlatGreen,
            onPressed: () {
              if (orderDetail.orderingService == 'Delivery') {
                Provider.of<OrderDetailsProvider>(context, listen: false)
                    .changeOrderStatusBy1(
                  context,
                  OrderStatus.deliveryPlaced,
                  orderDetail.id!,
                );
              } else if (orderDetail.orderingService == 'Pickup') {
                Provider.of<OrderDetailsProvider>(context, listen: false)
                    .changeOrderStatusBy1(
                  context,
                  OrderStatus.pickupPlaced,
                  orderDetail.id!,
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Row _buildOrderFulfilledRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.check_circle,
          size: 26,
          color: kColorGreen,
        ),
        const SizedBox(
          width: 2,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(
            'Order Fulfilled',
            style: AppTextStyles.semiBoldMedium(),
          ),
        ),
      ],
    );
  }

  Container _buildOutlinedContainer(Color color, String text, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 26,
            color: color,
          ),
          const SizedBox(
            width: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              text,
              style: AppTextStyles.semiBoldMedium(color: color),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Consumer<OrderDetailsProvider>(
        builder: (context, orderDetailsProvider, _) {
          final orderDetail = orderDetailsProvider.orderDetail!;
          final currentStatusId =
              OrderStatus.getOrderIdFromStatusEnumAndOrderMethod(
            orderDetail.statusEnum,
            orderDetail.orderingService,
          );
          print('currentStatusEnum: ${orderDetail.statusEnum}');
          print('orderingService: ${orderDetail.orderingService}');
          print('currentStatusId: $currentStatusId');
          if (orderDetailsProvider.loading) {
            return const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                backgroundColor: Colors.black,
                color: kColorWhite,
                strokeWidth: 3,
              ),
            );
          } else {
            return _buildButton(currentStatusId, context, orderDetail);
          }
        },
      ),
    );
  }

  Widget _buildButton(
    int currentStatusId,
    BuildContext context,
    OrderDetail orderDetail,
  ) {
    if (currentStatusId == OrderStatus.deliveryPlaced ||
        currentStatusId == OrderStatus.pickupPlaced) {
      return buildAcceptButtonRow(context, orderDetail);
    } else if (currentStatusId == OrderStatus.deliveryAccepted ||
        currentStatusId == OrderStatus.pickupAccepted) {
      return StatusModifierButton(
        buttonColor: kColorFlatBlue,
        buttonText: 'Mark this order as Ready',
        onPressed: () {
          if (orderDetail.orderingService == 'Delivery') {
            Provider.of<OrderDetailsProvider>(context, listen: false)
                .changeOrderStatusBy1(
              context,
              OrderStatus.deliveryAccepted,
              orderDetail.id!,
            );
          } else if (orderDetail.orderingService == 'Pickup') {
            Provider.of<OrderDetailsProvider>(context, listen: false)
                .changeOrderStatusBy1(
              context,
              OrderStatus.pickupAccepted,
              orderDetail.id!,
            );
          }
        },
      );
    } else if (currentStatusId == OrderStatus.deliveryReady) {
      return StatusModifierButton(
        buttonColor: kColorFlatViolet,
        buttonText: 'Mark this order as In-Route',
        onPressed: () {
          Provider.of<OrderDetailsProvider>(context, listen: false)
              .changeOrderStatusBy1(
            context,
            OrderStatus.deliveryReady,
            orderDetail.id!,
          );
        },
      );
    } else if (currentStatusId == OrderStatus.deliveryInRoute ||
        currentStatusId == OrderStatus.pickupReady) {
      return StatusModifierButton(
        onPressed: () {
          if (orderDetail.orderingService == 'Delivery') {
            Provider.of<OrderDetailsProvider>(context, listen: false)
                .changeOrderStatusBy1(
              context,
              OrderStatus.deliveryInRoute,
              orderDetail.id!,
            );
          } else if (orderDetail.orderingService == 'Pickup') {
            Provider.of<OrderDetailsProvider>(context, listen: false)
                .changeOrderStatusBy1(
              context,
              OrderStatus.pickupReady,
              orderDetail.id!,
            );
          }
        },
        buttonText: 'Mark this order as Completed',
        buttonColor: kColorFlatGreen,
      );
    } else if (currentStatusId == OrderStatus.deliveryCompleted ||
        currentStatusId == OrderStatus.pickupCompleted) {
      return _buildOutlinedContainer(
        kColorGreen,
        'Order Completed',
        Icons.check_circle,
      );
    } else if (currentStatusId == OrderStatus.cancelled) {
      return _buildOutlinedContainer(
        kColorFlatRed,
        'Order Cancelled',
        Icons.cancel_rounded,
      );
    } else {
      return const Text('Unknown');
    }
  }
}

class StatusModifierButton extends StatelessWidget {
  const StatusModifierButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.buttonColor,
  });

  final Color buttonColor;
  final String buttonText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        textStyle: const TextStyle(color: kColorWhite),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: AppTextStyles.semiBoldBody(
          color: kColorWhite,
        ),
      ),
    );
  }
}
