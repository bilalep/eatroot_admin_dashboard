class OrderStatus {
  static List<String> orderStatusApiDefaults = [
    'placed',
    'accepted',
    'ready',
    'in-route',
    'completed',
    'cancelled',
  ];

  static List<String> timeList = [
    'in last 24 hours',
    'in last 7 days',
    'in last 30 days',
    'all time',
  ];

  static final Map<int?, String?> _currentStatusDescription = {
    1: 'Delivery Order Placed',
    2: 'Delivery Order Accepted',
    3: 'Delivery Ready',
    4: 'Delivery Order In Route',
    5: 'Delivery Order Completed',
    6: 'Pickup Order Placed',
    7: 'Pickup Order Accepted',
    8: 'Pickup Order Ready',
    9: 'Pickup Order Completed',
    10: 'Order Cancelled',
  };

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

  static String getStatusDescription(int currentStatus) {
    return _currentStatusDescription[currentStatus] ?? 'Unknown';
  }

  static String getButtonText(int currentStatus) {
    switch (currentStatus) {
      case 1:
      case 6:
        return 'Accept Order';
      case 2:
      case 7:
        return 'Order is Prepared';
      case 3:
        return 'Order is In Route';
      case 4:
      case 8:
        return 'Order is Picked Up';
      case 5:
      case 9:
        return 'Go Back';
      case 10:
        return 'Order is Cancelled';
      default:
        return 'Go Back';
    }
  }

  /*  static String currentOrderStatusShort(String status) {
    switch (status) {
      case 1:
      case 6:
        return 'Placed';
      case 2:
      case 7:
        return 'Accepted';
      case 3:
      case 8:
        return 'Ready';
      case 4:
        return 'In Route';
      case 5:
      case 9:
        return 'Completed';
      case 10:
        return 'Cancelled';
      default:
        return 'Status Unavailable';
    }
  } */
}
