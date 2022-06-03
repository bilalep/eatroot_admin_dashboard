import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/providers/live_order_provider.dart';

import 'widgets/live_order_list_tile.dart';

class LiveOrderListScreen extends StatefulWidget {
  static const routeName = 'live_order_list';
  const LiveOrderListScreen({Key? key}) : super(key: key);

  @override
  State<LiveOrderListScreen> createState() => _LiveOrderListScreenState();
}

class _LiveOrderListScreenState extends State<LiveOrderListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Live Orders'),
        ),
        body: RefreshIndicator(
          onRefresh: () =>
              context.read<LiveOrderProvider>().getLiveOrderListFromService(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              physics: const ScrollPhysics(),
              children: [
                Consumer<LiveOrderProvider>(
                  builder: (context, LiveOrderProvider orderProvider, _) {
                    if (orderProvider.loading) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    final orderList = orderProvider.orders;
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: orderProvider.orders.length,
                      itemBuilder: (context, index) =>
                          LiveOrderListTile(orderList: orderList, index: index),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 8.0,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
