import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/presentation/core/widgets/rounded_text_box_small.dart';
import 'package:tech_test/presentation/core/widgets/top_container_pink.dart';
import 'package:tech_test/presentation/screens/order_details/widgets/customer_details_container.dart';
import 'package:tech_test/presentation/screens/order_details/widgets/items_expansion_panel_list.dart';
import 'package:tech_test/presentation/screens/order_details/widgets/order_status_modifier_widget.dart';
import 'package:tech_test/providers/order_detail_provider.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/constants.dart';
import 'package:tech_test/utils/extensions.dart';
import 'package:tech_test/utils/text_styles.dart';
import 'package:timeago/timeago.dart' as timeago;

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  static const routeName = 'order_details';

  String buildTimeAgoText({DateTime? time, required String defaultValue}) {
    if (time == null) {
      return defaultValue;
    } else {
      return timeago.format(
        time,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderDetailsProvider>(
      builder: (context, orderDetailProvider, _) {
        final orderDetail = orderDetailProvider.orderDetail;
        return SafeArea(
          child: Scaffold(
            backgroundColor: kColorOrderTileBG,
            body: orderDetail == null || orderDetailProvider.loading
                ? const Center(
                    child: kLoadingIndicatorPink,
                  )
                : RefreshIndicator(
                    onRefresh: () => Provider.of<OrderDetailsProvider>(
                      context,
                      listen: false,
                    ).getOrderDetailsFromId(orderDetail.id!),
                    color: kColorPrimaryPink,
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TopContainerPink(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Order #${orderDetail.orderNo}',
                                        style: kTSOrderDetailScreenAppBarTitle,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8),
                                    child: CustomerDetailsContainer(),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Container(
                                child: Row(
                                  children: [
                                    RoundedTextBoxSmall(
                                      color: kColorYellow,
                                      text: orderDetail.orderingService ?? '',
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    RoundedTextBoxSmall(
                                      color: kColorPrimaryPink,
                                      text:
                                          (orderDetail.status ?? 'Unavailable')
                                              .capitalize(),
                                    ),
                                    const Spacer(),
                                    Text(
                                      buildTimeAgoText(
                                        time: orderDetail.orderedAtFormatted,
                                        defaultValue: '-',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // ignore: use_decorated_box
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      16,
                                      8,
                                      16,
                                      0,
                                    ),
                                    child: Text(
                                      'Items',
                                      style: kTSOrderDetailScreenTitle1,
                                    ),
                                  ),
                                  ItemsExpansionPanelList(
                                    orderDetail: orderDetail,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Subtotal: ${orderDetail.actualSubTotal}',
                                            style: kTSMedium13Black,
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'VAT: ${orderDetail.tax}',
                                            style: kTSMedium13Black,
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'Delivery Fee: ${orderDetail.deliveryFee}',
                                            style: kTSMedium13Black,
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Total: ',
                                                  style:
                                                      kTSOrderDetailScreenTitle2,
                                                ),
                                                TextSpan(
                                                  text: orderDetail.amountToPay,
                                                  style:
                                                      kTSOrderDetailScreenTitle2,
                                                ),
                                                TextSpan(
                                                  text: ' AED',
                                                  style:
                                                      kTSOrderDetailScreenTitle2,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 80,
                            child: const OrderStatusModifierWidget(),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
