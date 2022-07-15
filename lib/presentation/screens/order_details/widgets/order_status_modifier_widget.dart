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

  DecoratedBox _buildOutlinedContainer(
    Color color,
    String text,
    IconData icon,
  ) {
    return DecoratedBox(
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
    switch (currentStatusId) {
      case OrderStatus.pickupPlaced:
      case OrderStatus.deliveryPlaced:
        return buildAcceptButtonRow(context, orderDetail);

      case OrderStatus.pickupAccepted:
      case OrderStatus.deliveryAccepted:
        return _buildReadyButton(orderDetail, context);

      case OrderStatus.deliveryReady:
        return _buildInRouteButton(context, orderDetail);

      case OrderStatus.deliveryInRoute:
      case OrderStatus.pickupReady:
        return _buildCompletedButton(orderDetail, context);

      case OrderStatus.deliveryCompleted:
      case OrderStatus.pickupCompleted:
        return _buildOutlinedContainer(
          kColorGreen,
          'Order Completed',
          Icons.check_circle,
        );

      case OrderStatus.cancelled:
        return _buildOutlinedContainer(
          kColorFlatRed,
          'Order Cancelled',
          Icons.cancel_rounded,
        );

      default:
        return _buildOutlinedContainer(
          kColorFlatRed,
          'Unknown Status',
          Icons.error,
        );
    }
  }

  StatusModifierButton _buildCompletedButton(
    OrderDetail orderDetail,
    BuildContext context,
  ) {
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
  }

  StatusModifierButton _buildInRouteButton(
    BuildContext context,
    OrderDetail orderDetail,
  ) {
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
  }

  StatusModifierButton _buildReadyButton(
    OrderDetail orderDetail,
    BuildContext context,
  ) {
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
