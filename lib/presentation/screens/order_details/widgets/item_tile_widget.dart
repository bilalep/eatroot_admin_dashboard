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



/* if (orderItem.attributes!.isEmpty || orderItem.attributes == null)
            const SizedBox()
          else
            SizedBox(
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
            ), */