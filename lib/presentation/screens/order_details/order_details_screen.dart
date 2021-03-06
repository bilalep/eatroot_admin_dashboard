import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/presentation/core/widgets/rounded_text_box_small.dart';
import 'package:tech_test/presentation/core/widgets/top_container_pink.dart';
import 'package:tech_test/presentation/screens/order_details/widgets/customer_details_container.dart';
import 'package:tech_test/presentation/screens/order_details/widgets/item_details_container.dart';
import 'package:tech_test/presentation/screens/order_details/widgets/order_details_title_row.dart';
import 'package:tech_test/presentation/screens/order_details/widgets/order_status_modifier_widget.dart';
import 'package:tech_test/providers/order_detail_provider.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/constants.dart';
import 'package:tech_test/utils/extensions.dart';
import 'package:tech_test/utils/order_status.dart';
import 'package:timeago/timeago.dart' as timeago;

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  static const routeName = 'order_details';

  String buildTimeAgoText({DateTime? time, required String defaultValue}) {
    //TODO check time zone and adjust time ago
    final dateTime = DateTime.now();
    if (time == null) {
      return defaultValue;
    } else {
      return timeago.format(
        time,
        clock: DateTime.now().subtract(dateTime.timeZoneOffset),
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
                        ListView(
                          children: [
                            TopContainerPink(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Column(
                                children: [
                                  OrderDetailsTitleRow(
                                    orderDetail: orderDetail,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8),
                                    child: CustomerDetailsContainer(),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
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
                                    color: OrderStatus.getStatusBoxColor(
                                      orderDetail.status ?? '',
                                    ),
                                    text: (orderDetail.status ?? 'Unavailable')
                                        .capitalize(),
                                  ),
                                  const Spacer(),
                                  Tooltip(
                                    message: orderDetail.orderedAt ?? '',
                                    child: Text(
                                      buildTimeAgoText(
                                        time: orderDetail.orderedAtFormatted,
                                        defaultValue: '-',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: ItemDetailsContainer(
                                orderDetail: orderDetail,
                              ),
                            ),
                            const SizedBox(
                              height: 96,
                            )
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 96,
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
