class OrderStatus {
  final int _currentStatus;

  OrderStatus(this._currentStatus);

  final Map _currentStatusDescription = {
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

  String getStatusDescription() {
    return _currentStatusDescription[_currentStatus];
  }

  String getButtonText() {
    switch (_currentStatus) {
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
}
