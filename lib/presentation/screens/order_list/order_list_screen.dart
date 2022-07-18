import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/models/order_list/order.dart';
import 'package:tech_test/presentation/core/widgets/empty_states_column.dart';
import 'package:tech_test/presentation/core/widgets/top_container_pink.dart';
import 'package:tech_test/presentation/screens/order_list/widgets/automatic_animated_list.dart';
import 'package:tech_test/presentation/screens/order_list/widgets/no_orders_icon_painter.dart';
import 'package:tech_test/presentation/screens/order_list/widgets/order_filter.dart';
import 'package:tech_test/presentation/screens/order_list/widgets/order_list_shimmer_list.dart';
import 'package:tech_test/presentation/screens/order_list/widgets/order_list_tile.dart';
import 'package:tech_test/presentation/screens/order_list/widgets/order_list_title_row.dart';
import 'package:tech_test/presentation/screens/order_list/widgets/order_quantity_selector.dart';
import 'package:tech_test/providers/live_order_provider.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/constants.dart';
import 'package:tech_test/utils/text_styles.dart';

final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  static const routeName = 'live_order_list';

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  final double _iconWidth = 200;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kColorOrderTileBG,
        appBar: AppBar(
          backgroundColor: kColorPrimaryPink,
          elevation: 0,
          title: const OrderListTitleRow(),
        ),
        body: RefreshIndicator(
          onRefresh: () =>
              context.read<LiveOrderProvider>().getLiveOrderListFromService(),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: TopContainerPink(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    // vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const OrderListTitleRow(),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Hi, $kUserName',
                        style: AppTextStyles.mediumMedium(
                          color: kColorWhite.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const OrderQuantitySelector(),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
              // const SliverAppBar(
              //   floating: true,
              //   snap: true,
              //   pinned: true,
              //   title: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              //     child: SizedBox(
              //       height: 56,
              //       // padding: const EdgeInsets.all(16),
              //       child: OrderFilter(),
              //     ),
              //   ),
              // ),
              SliverStickyHeader(
                header: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Container(
                    height: 56,
                    decoration: const BoxDecoration(
                      color: kColorOrderTileBG,
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: kColorBlue.withOpacity(0.2),
                      //     blurRadius: 10,
                      //     spreadRadius: 1,
                      //     offset: const Offset(0, 5),
                      //   )
                      // ],
                    ),
                    // padding: const EdgeInsets.all(16),
                    child: const OrderFilter(),
                  ),
                ),
                sliver: Consumer<LiveOrderProvider>(
                  builder: (context, LiveOrderProvider orderProvider, _) {
                    final orderList = orderProvider.filteredOrderList;
                    if (orderProvider.loading) {
                      return const OrderListShimmerList();
                    }
                    if (orderList.isEmpty) {
                      return SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: EmptyStatesColumn(
                            icon: CustomPaint(
                              size: Size(
                                _iconWidth,
                                (_iconWidth * 0.8192090395480226).toDouble(),
                              ),
                              painter: NoOrdersIconPainter(),
                            ),
                            title: 'Nothing to see here',
                            subTitle:
                                'Looks like there are no orders currently.',
                            iconWidth: _iconWidth,
                          ),
                        ),
                      );
                    }
                    return SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      sliver: AutomaticAnimatedList<Order>(
                        keyingFunction: (item) => Key(item.id!.toString()),
                        insertDuration: const Duration(milliseconds: 600),
                        removeDuration: const Duration(milliseconds: 500),
                        items: orderList,
                        itemBuilder: (context, order, animation) {
                          return FadeTransition(
                            opacity: CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeInOut,
                              reverseCurve: Curves.easeInOut,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: OrderListTile(
                                order: order,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                    //   // separatorBuilder: (context, index) => const SizedBox(
                    //   //   height: 16,
                    //   // ),
                    // );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
