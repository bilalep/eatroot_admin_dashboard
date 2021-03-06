import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/models/order_details/order_detail.dart';
import 'package:tech_test/providers/live_order_provider.dart';
import 'package:tech_test/services/api_service.dart';

class OrderDetailsProvider extends ChangeNotifier {
  ApiService apiService = ApiService();

  bool _loading = true;
  OrderDetail? _orderDetail;

  OrderDetail? get orderDetail => _orderDetail;

  bool get loading => _loading;

  Future<void> getOrderDetailsFromId(int id) async {
    _loading = true;
    final apiService = ApiService();
    notifyListeners();
    final tempOrderDetail = await apiService.getOrderDetailsFromId(id);
    if (tempOrderDetail != null) {
      _orderDetail = tempOrderDetail;
    }
    _loading = false;
    notifyListeners();
  }

  Future<void> changeOrderStatusBy1(
    BuildContext ctx,
    int currentStatus,
    int orderId,
  ) async {
    final terminalStatuses = [5, 9, 10];
    _loading = true;
    final liveOrderProvider =
        Provider.of<LiveOrderProvider>(ctx, listen: false);
    notifyListeners();
    if (currentStatus == 5 || currentStatus == 9 || currentStatus == 10) {
      return;
    }
    if (currentStatus > 0 &&
        currentStatus < 9 &&
        !terminalStatuses.contains(currentStatus)) {
      await apiService.changeOrderStatusById(orderId, currentStatus + 1);
      await getOrderDetailsFromId(orderId);
      await liveOrderProvider.getLiveOrderListFromService();

      _loading = false;
      notifyListeners();
    }
  }

  Future<void> cancelOrder(BuildContext ctx, int orderId) async {
    _loading = true;
    notifyListeners();
    final liveOrderProvider =
        Provider.of<LiveOrderProvider>(ctx, listen: false);
    await apiService.changeOrderStatusById(orderId, 10);
    await getOrderDetailsFromId(orderId);
    await liveOrderProvider.getLiveOrderListFromService();
    _loading = false;
    notifyListeners();
  }

/* 
  Future<void> acceptDeliveryOrder(int orderId) async {
    await apiService.changeOrderStatusById(orderId, 2);
    notifyListeners();
  }

  Future<void> readyDeliveryOrder(int orderId) async {
    await apiService.changeOrderStatusById(orderId, 3);
    notifyListeners();
  }

  Future<void> inRouteDeliveryOrder(int orderId) async {
    await apiService.changeOrderStatusById(orderId, 4);
    notifyListeners();
  }

  Future<void> completedDeliveryOrder(int orderId) async {
    await apiService.changeOrderStatusById(orderId, 5);
    notifyListeners();
  }

  Future<void> acceptPickupOrder(int orderId) async {
    await apiService.changeOrderStatusById(orderId, 7);
    notifyListeners();
  }

  Future<void> readyPickupOrder(int orderId) async {
    await apiService.changeOrderStatusById(orderId, 8);
    notifyListeners();
  }

  Future<void> completedPickupOrder(int orderId) async {
    await apiService.changeOrderStatusById(orderId, 9);
    notifyListeners();
  }

  Future<void> cancelOrder(int orderId) async {
    await apiService.changeOrderStatusById(orderId, 10);
    notifyListeners();
  } */
}
