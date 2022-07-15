import 'package:flutter/material.dart';

import 'package:tech_test/models/order_details/item.dart';

class ItemTileWidget extends StatelessWidget {
  const ItemTileWidget({
    super.key,
    required this.orderItem,
  });

  final Item orderItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${orderItem.quantity}x ${orderItem.menuName}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            '${orderItem.total ?? ''} AED',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
