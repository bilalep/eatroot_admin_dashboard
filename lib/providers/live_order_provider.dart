import 'package:flutter/material.dart';
import 'package:tech_test/models/order_list/order.dart';
import 'package:tech_test/services/api_service.dart';
import 'package:tech_test/utils/order_status.dart';

/// Provider for the live order list
class LiveOrderProvider extends ChangeNotifier {
  List<Order> _orders = [];

  /// List of orders
  List<Order> get orders => _orders;

  bool _loading = false;

  /// Loading state
  bool get loading => _loading;

  /// Fetch live order list from service
  Future<void> getLiveOrderListFromService() async {
    _loading = true;
    final apiService = ApiService();
    // notifyListeners();
    final tempOrderList = await apiService.getLiveOrderListFromApi();
    if (tempOrderList != null) {
      _orders = tempOrderList;
    }
    _loading = false;
    notifyListeners();
  }

  int getNoOfOrderByStatusAndTime(String status, String time) {
    final statusList = filterOrderByStatus(status)
      ..removeWhere((element) {
        return !filterOrderByTime(time).contains(element);
      });
    return statusList.length;
  }

  List<Order> filterOrderByStatus(String status) {
    return orders.where((element) => element.status == status).toList();
  }

  List<Order> filterOrderByTime(String time) {
    var timeDiff = DateTime.now();
    if (time == OrderStatus.timeList[0]) {
      timeDiff = DateTime.now().subtract(const Duration(days: 1));
    } else if (time == OrderStatus.timeList[1]) {
      timeDiff = DateTime.now().subtract(const Duration(days: 7));
    } else if (time == OrderStatus.timeList[2]) {
      timeDiff = DateTime.now().subtract(const Duration(days: 30));
    } else if (time == OrderStatus.timeList[3]) {
      timeDiff = DateTime(1800);
    }
    return orders.where((element) {
      if (element.orderAtFormatted == null) {
        return false;
      }
      return element.orderAtFormatted!.isAfter(timeDiff);
    }).toList();
  }
}
