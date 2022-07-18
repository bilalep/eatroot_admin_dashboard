import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/models/order_list/order.dart';
import 'package:tech_test/presentation/core/widgets/rounded_text_box_medium.dart';
import 'package:tech_test/presentation/core/widgets/rounded_text_box_small.dart';
import 'package:tech_test/presentation/screens/order_details/order_details_screen.dart';
import 'package:tech_test/providers/order_detail_provider.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/extensions.dart';
import 'package:tech_test/utils/order_status.dart';
import 'package:tech_test/utils/text_styles.dart';

class OrderListTile extends StatelessWidget {
  const OrderListTile({
    super.key,
    required this.order,
  });

  final Order order;

  double get textOpacity => 0.8;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: 2,
      transitionDuration: const Duration(milliseconds: 600),
      // transitionType: ContainerTransitionType.fadeThrough,
      closedBuilder: (context, openContainer) {
        return InkWell(
          onTap: () async {
            if (order.id != null) {
              unawaited(
                Provider.of<OrderDetailsProvider>(context, listen: false)
                    .getOrderDetailsFromId(order.id!),
              );
              openContainer();
              // await navigator.pushNamed(OrderDetailsScreen.routeName);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '#${order.orderNo ?? '-'}',
                      style: AppTextStyles.semiBoldMedium(
                        color: kColorPrimaryPink,
                      ),
                    ),
                    const SizedBox(height: 6),
                    _IconTextRow(
                      text: '${order.actualSubTotal} AED',
                      icon: Icons.payments,
                    ),
                    const SizedBox(height: 3),
                    _IconTextRow(
                      icon: Icons.calendar_month,
                      text: DateFormat.yMd()
                          .add_jm()
                          .format(order.orderAtFormatted ?? DateTime.now()),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RoundedTextBoxMedium(
                      color: OrderStatus.getStatusBoxColor(
                        order.status ?? '',
                      ),
                      text: order.status?.capitalize() ?? '-',
                    ),
                    const SizedBox(height: 6),
                    _IconTextRow(
                      icon: order.orderingService == 'Delivery'
                          ? Icons.local_shipping
                          : Icons.local_dining,
                      text: order.orderingService ?? '',
                    ),
                    const SizedBox(height: 2),
                    _IconTextRow(
                      icon: Icons.payment,
                      text: order.paymentMethod?.trim() ?? '',
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      openBuilder: (context, closedContainer) {
        return const OrderDetailsScreen();
      },
    );
  }
}

class _IconTextRow extends StatelessWidget {
  const _IconTextRow({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: kColorBlack.withOpacity(0.8),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: AppTextStyles.semiBoldSmall(
            color: kColorBlack.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}

class OrderListTileOld extends StatelessWidget {
  const OrderListTileOld({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: 2,
      transitionDuration: const Duration(milliseconds: 600),
      // transitionType: ContainerTransitionType.fadeThrough,
      closedBuilder: (context, openContainer) {
        return InkWell(
          onTap: () async {
            if (order.id != null) {
              unawaited(
                Provider.of<OrderDetailsProvider>(context, listen: false)
                    .getOrderDetailsFromId(order.id!),
              );
              openContainer();
              // await navigator.pushNamed(OrderDetailsScreen.routeName);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '#${order.orderNo ?? '-'}',
                      style: AppTextStyles.semiBoldMedium(
                        color: kColorPrimaryPink,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      order.channel?.trim() ?? '-',
                      style: AppTextStyles.semiBoldBody(
                        color: kColorBlack.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      order.orderAt?.trim() ?? '-',
                      style: AppTextStyles.semiBoldBody(
                        color: kColorBlack.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'AED ${order.actualSubTotal}',
                      style: AppTextStyles.semiBoldMedium(
                        color: kColorPrimaryPink,
                      ),
                    ),
                    const SizedBox(height: 4),
                    RoundedTextBoxSmall(
                      text: order.paymentMethod ?? '-',
                      color: kColorYellow,
                    ),
                    const SizedBox(height: 4),
                    RoundedTextBoxSmall(
                      color: OrderStatus.getStatusBoxColor(
                        order.status ?? '',
                      ),
                      text: order.status?.capitalize() ?? '-',
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      openBuilder: (context, closedContainer) {
        return const OrderDetailsScreen();
      },
    );
    // );
  }
}
