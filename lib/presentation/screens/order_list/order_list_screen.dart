// ignore_for_file: dead_code, literal_only_boolean_expressions

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/presentation/core/widgets/top_container_pink.dart';
import 'package:tech_test/presentation/screens/order_list/widgets/order_list_shimmer_list.dart';
import 'package:tech_test/presentation/screens/order_list/widgets/order_list_tile.dart';
import 'package:tech_test/presentation/screens/order_list/widgets/order_list_title_row.dart';
import 'package:tech_test/presentation/screens/order_list/widgets/order_quantity_selector.dart';
import 'package:tech_test/providers/auth_provider.dart';
import 'package:tech_test/providers/live_order_provider.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/text_styles.dart';

class LiveOrderListScreen extends StatefulWidget {
  const LiveOrderListScreen({super.key});

  static const routeName = 'live_order_list';

  @override
  State<LiveOrderListScreen> createState() => _LiveOrderListScreenState();
}

class _LiveOrderListScreenState extends State<LiveOrderListScreen> {
  @override
  Widget build(BuildContext context) {
    final username = Provider.of<AuthProvider>(context).userDetails?.name;
    print('user${Provider.of<AuthProvider>(context).userDetails}');
    print('base user${Provider.of<AuthProvider>(context).baseUser}');
    return SafeArea(
      child: Scaffold(
        backgroundColor: kColorOrderTileBG,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: TopContainerPink(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const OrderListTitleRow(),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Hi, ${username ?? 'Unavailable'}',
                        style: kTSOrderScreenSubTitle2,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const OrderQuantitySelector(),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(
                      color: kColorPrimaryPink,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Orders filter placeholder', //TODO replace with filter widget, (https://dribbble.com/shots/12479001-Zomato-restaurant-partner-app)
                    ),
                  ),
                ),
              ),
            ];
          },
          body: RefreshIndicator(
            onRefresh: () =>
                context.read<LiveOrderProvider>().getLiveOrderListFromService(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Consumer<LiveOrderProvider>(
                builder: (context, LiveOrderProvider orderProvider, _) {
                  if (orderProvider.loading) {
                    return const OrderListShimmerList();
                  }
                  final orderList = orderProvider.orders;
                  return ListView.separated(
                    itemCount: orderProvider.orders.length,
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
    );
  }
}
