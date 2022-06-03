import 'package:flutter/material.dart';
import 'package:tech_test/services/api_service.dart';

import '../models/order_list/order.dart';

class LiveOrderProvider extends ChangeNotifier {
  List<Order> _orders = [];
  List<Order> get orders => _orders;

  bool _loading = true;
  bool get loading => _loading;

  Future<void> getLiveOrderListFromService() async {
    _loading = true;
    ApiService apiService = ApiService();
    // notifyListeners();
    final tempOrderList = await apiService.getLiveOrderListFromApi();
    if (tempOrderList != null) {
      _orders = tempOrderList;
    }
    _loading = false;
    notifyListeners();
  }
}
