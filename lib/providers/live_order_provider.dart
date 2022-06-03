import 'package:flutter/material.dart';
import 'package:tech_test/models/order_list/order.dart';
import 'package:tech_test/services/api_service.dart';

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
}
