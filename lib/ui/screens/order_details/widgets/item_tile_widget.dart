import 'package:flutter/material.dart';

import '../../../../models/order_details/item.dart';

class ItemTileWidget extends StatelessWidget {
  const ItemTileWidget({
    Key? key,
    required this.orderItem,
  }) : super(key: key);

  final Item orderItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            orderItem.menuName ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 4),
          orderItem.attributes!.isEmpty || orderItem.attributes == null
              ? const SizedBox()
              : SizedBox(
                  height: 20,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                        orderItem.attributes![index]!.attribute ?? '',
                        style: const TextStyle(color: Colors.black54),
                      );
                    },
                    itemCount: orderItem.attributes!.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const Text(
                        ' + ',
                        style: TextStyle(color: Colors.black54),
                      );
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
          const SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${orderItem.total ?? ''} AED',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                'Qty: ${orderItem.quantity ?? ''}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
