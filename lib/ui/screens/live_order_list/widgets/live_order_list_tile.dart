import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/ui/core/widgets/order_type_icon.dart';

import 'package:tech_test/models/order_list/order.dart';
import 'package:tech_test/providers/order_detail_provider.dart';
import 'package:tech_test/ui/screens/order_details/order_details_screen.dart';

class LiveOrderListTile extends StatelessWidget {
  const LiveOrderListTile({
    super.key,
    required this.orderList,
    required this.index,
  });

  final int index;
  final List<Order> orderList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading:
            OrderTypeIcon(orderingMethod: orderList[index].orderingService),
        title: Text(orderList[index].customer?.name ?? ''),
        subtitle: Text(
          orderList[index].address?.address ?? '',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        trailing: Text(orderList[index].status ?? ''),
        onTap: () async {
          if (orderList[index].id != null) {
            final navigator = Navigator.of(context);
            unawaited(
              Provider.of<OrderDetailsProvider>(context, listen: false)
                  .getOrderDetailsFromId(orderList[index].id!),
            );
            await navigator.pushNamed(OrderDetailsScreen.routeName);
          }
        },
      ),
    );
  }
}
