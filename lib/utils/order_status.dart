import 'package:flutter/cupertino.dart';
import 'package:tech_test/models/order_details/order_detail.dart';
import 'package:tech_test/utils/colors.dart';

class OrderStatus {
  static List<String> orderStatusApiDefaults = [
    'placed',
    'accepted',
    'ready',
    'in-route',
    'completed',
    'cancelled',
  ];

  static int getStatusIdFromStatusNameAndOrderMethod(
    String statusName,
    String orderMethod,
  ) {
    if (orderMethod == 'Delivery') {
      switch (statusName) {
        case 'placed':
          return 1;
        case 'accepted':
          return 2;
        case 'ready':
          return 3;
        case 'in-route':
          return 4;
        case 'completed':
          return 5;
        case 'cancelled':
          return 10;
        default:
          throw Exception('Unknown delivery status name: $statusName');
      }
    } else if (orderMethod == 'Pickup') {
      switch (statusName) {
        case 'placed':
          return 6;
        case 'accepted':
          return 7;
        case 'completed':
          return 8;
        case 'ready':
          return 9;
        case 'cancelled':
          return 10;
        default:
          throw Exception('Unknown pickup status name: $statusName');
      }
    }
    throw Exception('Unknown order method: $orderMethod');
  }

  static int getOrderIdFromStatusEnumAndOrderMethod(
    Status? status,
    String? orderMethod,
  ) {
    if (orderMethod == 'Delivery') {
      switch (status) {
        case Status.placed:
          return 1;
        case Status.accepted:
          return 2;
        case Status.ready:
          return 3;
        case Status.inRoute:
          return 4;
        case Status.completed:
          return 5;
        case Status.cancelled:
          return 10;
        default:
          throw Exception('Unknown delivery status enum: $status');
      }
    } else if (orderMethod == 'Pickup') {
      switch (status) {
        case Status.placed:
          return 6;
        case Status.accepted:
          return 7;
        case Status.ready:
          return 8;
        case Status.completed:
          return 9;
        case Status.cancelled:
          return 10;
        default:
          throw Exception('Unknown pickup status name: $status');
      }
    }
    throw Exception('Unknown order method: $orderMethod');
  }

  static List<Color> statusBoxColorList = [
    kColorFlatOrange2,
    kColorGreen,
    kColorFlatBlue2,
    kColorFlatViolet,
    kColorFlatGreen,
    kColorFlatRed,
  ];

  static Color getStatusBoxColor(String status) {
    final index = orderStatusApiDefaults.indexOf(status);
    if (index != -1) {
      return statusBoxColorList[index];
    } else {
      return kColorFlatBlue;
    }
  }

  static List<String> timeList = [
    'in last 24 hours',
    'in last 7 days',
    'in last 30 days',
    'all time',
  ];

  // static final Map<int?, String?> _currentStatusDescription = {
  //   1: 'Delivery Order Placed',
  //   2: 'Delivery Order Accepted',
  //   3: 'Delivery Ready',
  //   4: 'Delivery Order In Route',
  //   5: 'Delivery Order Completed',
  //   6: 'Pickup Order Placed',
  //   7: 'Pickup Order Accepted',
  //   8: 'Pickup Order Ready',
  //   9: 'Pickup Order Completed',
  //   10: 'Order Cancelled',
  // };

  static int get deliveryPlaced => 1;
  static int get deliveryAccepted => 2;
  static int get deliveryReady => 3;
  static int get deliveryInRoute => 4;
  static int get deliveryCompleted => 5;
  static int get pickupPlaced => 6;
  static int get pickupAccepted => 7;
  static int get pickupReady => 8;
  static int get pickupCompleted => 9;
  static int get cancelled => 10;
}
