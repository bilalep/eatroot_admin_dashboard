import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/models/order_list/order.dart';
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
                    Row(
                      children: [
                        Icon(
                          order.orderingService == 'Delivery'
                              ? Icons.local_shipping
                              : Icons.fastfood,
                          color: kColorBlack.withOpacity(0.7),
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          order.orderingService ?? '-',
                          style: AppTextStyles.semiBoldBody(
                            color: kColorBlack.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.calendar_month_sharp,
                          color: kColorBlack.withOpacity(0.7),
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${order.orderAtFormatted?.day}-${order.orderAtFormatted?.month}-${order.orderAtFormatted?.year} ${order.orderAtFormatted?.hour}:${order.orderAtFormatted?.minute}',
                          style: AppTextStyles.semiBoldBody(
                            color: kColorBlack.withOpacity(0.7),
                          ),
                        ),
                      ],
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
                      color: OrderStatus.getStatusBoxColor(
                        order.status ?? '',
                      ),
                      text: order.status?.capitalize() ?? '-',
                    ),
                    const SizedBox(height: 4),
                    RoundedTextBoxSmall(
                      color: kColorYellow,
                      text: order.paymentMethod?.trim() ?? '-',
                    )
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
    // return Material(
    //   color: kColorWhite,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    //   elevation: 2,
    //   child: InkWell(
    //     onTap: () async {
    //       if (orderList[index].id != null) {
    //         final navigator = Navigator.of(context);
    //         unawaited(
    //           Provider.of<OrderDetailsProvider>(context, listen: false)
    //               .getOrderDetailsFromId(orderList[index].id!),
    //         );
    //         await navigator.pushNamed(OrderDetailsScreen.routeName);
    //       }
    //     },
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               Text(
    //                 '#${orderList[index].orderNo ?? '-'}',
    //                 style: kTSOrderTileTitle1,
    //               ),
    //               const SizedBox(height: 10),
    //               Text(
    //                 orderList[index].channel?.trim() ?? '-',
    //                 style: kTSOrderTileSubTitleSemiTrans,
    //               ),
    //               const SizedBox(height: 2),
    //               Text(
    //                 orderList[index].orderAt?.trim() ?? '-',
    //                 style: kTSOrderTileSubTitleSemiTrans,
    //               ),
    //             ],
    //           ),
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.end,
    //             children: [
    //               Text(
    //                 'AED ${orderList[index].actualSubTotal}',
    //                 style: kTSOrderTileTitle1,
    //               ),
    //               const SizedBox(height: 4),
    //               RoundedTextBoxSmall(
    //                 text: orderList[index].paymentMethod ?? '-',
    //                 color: kColorYellow,
    //               ),
    //               const SizedBox(height: 4),
    //               RoundedTextBoxSmall(
    //                 color: kColorPrimaryPink,
    //                 text: orderList[index].status?.capitalize() ?? '-',
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
