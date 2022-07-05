import 'package:flutter/material.dart';

class OrderTypeIcon extends StatelessWidget {
  const OrderTypeIcon({
    super.key,
    required this.orderingMethod,
  });

  final String? orderingMethod;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      child: Icon(
        orderingMethod == 'Delivery'
            ? Icons.local_shipping
            : Icons.local_dining,
      ),
    );
  }
}
