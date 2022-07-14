import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:tech_test/presentation/core/widgets/top_container_pink.dart';
import 'package:tech_test/presentation/screens/order_list/widgets/order_filter.dart';
import 'package:tech_test/presentation/screens/order_list/widgets/order_list_shimmer_list.dart';
import 'package:tech_test/presentation/screens/order_list/widgets/order_list_tile.dart';
import 'package:tech_test/presentation/screens/order_list/widgets/order_list_title_row.dart';
import 'package:tech_test/presentation/screens/order_list/widgets/order_quantity_selector.dart';
import 'package:tech_test/providers/live_order_provider.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/constants.dart';
import 'package:tech_test/utils/text_styles.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  static const routeName = 'live_order_list';

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
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
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
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
            ];
          },
          body: RefreshIndicator(
            onRefresh: () =>
                context.read<LiveOrderProvider>().getLiveOrderListFromService(),
            color: kColorPrimaryPink,
            child: StickyHeader(
              header: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
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
              content: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Consumer<LiveOrderProvider>(
                  builder: (context, LiveOrderProvider orderProvider, _) {
                    if (orderProvider.loading) {
                      return const OrderListShimmerList();
                    }
                    final orderList = orderProvider.filteredOrderList;
                    return ListView.separated(
                      itemCount: orderProvider.filteredOrderList.length,
                      itemBuilder: (context, index) => LiveOrderListTile(
                        orderList: orderList,
                        index: index,
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 16,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
