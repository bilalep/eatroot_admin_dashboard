import 'package:flutter/material.dart';
import 'package:tech_test/models/order_list/order.dart';
import 'package:tech_test/services/api_service.dart';
import 'package:tech_test/utils/order_status.dart';

/// Provider for the live order list
class LiveOrderProvider extends ChangeNotifier {
  List<Order> _filteredOrderList = [];
  bool _loading = false;
  List<Order> _orders = [];

  List<bool> isButtonSelectedList =
      List.generate(OrderStatus.orderStatusApiDefaults.length, (index) {
    return true;
  });

  List<Order> get filteredOrderList => _filteredOrderList;

  String orderQuantitySelectedTime = OrderStatus.timeList[0];
  String orderQuantitySelectedStatus = OrderStatus.orderStatusApiDefaults[0];
  int _orderQuantity = 0;
  int get orderQuantity => _orderQuantity;

  /// List of orders
  List<Order> get orders => _orders;

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
      filterOrderListByBoolList(isButtonSelectedList);
    }
    _loading = false;
    notifyListeners();
  }

  void changeSelectedTime(String time) {
    orderQuantitySelectedTime = time;
    getNoOfOrderByStatusAndTime();
    notifyListeners();
  }

  void changeSelectedStatus(String status) {
    orderQuantitySelectedStatus = status;
    getNoOfOrderByStatusAndTime();
    notifyListeners();
  }

  void getNoOfOrderByStatusAndTime() {
    print(
      'status: $orderQuantitySelectedStatus, time: $orderQuantitySelectedTime',
    );
    final statusList = getOrderListByStatus(orderQuantitySelectedStatus)
      ..removeWhere((element) {
        return !filterOrderByTime(orderQuantitySelectedTime).contains(element);
      });
    _orderQuantity = statusList.length;
    print('_orderQuantity: $_orderQuantity');
  }

  List<Order> getOrderListByStatus(String status) {
    return orders.where((element) => element.status == status).toList();
  }

  // void filterOrderList(String status) {
  //   if (_selectedOrderStatusList.contains(status)) {
  //     _selectedOrderStatusList.remove(status);
  //   } else {
  //     _selectedOrderStatusList.add(status);
  //   }
  //   final tempList = <Order>[];
  //   for (final element in _selectedOrderStatusList) {
  //     tempList.addAll(getOrderListByStatus(element));
  //   }
  //   _filteredOrderList = tempList;
  //   print('filteredOrderList: ${_filteredOrderList.length}');
  //   notifyListeners();
  // }

  void filterOrderListByBoolList(List<bool> boolList) {
    final tempList = <Order>[];
    for (final element in boolList) {
      if (element) {
        tempList.addAll(
          getOrderListByStatus(
            OrderStatus.orderStatusApiDefaults[boolList.indexOf(element)],
          ),
        );
      }
    }
    boolList.asMap().forEach((index, value) {
      if (value) {
        tempList.addAll(
          getOrderListByStatus(OrderStatus.orderStatusApiDefaults[index]),
        );
      }
    });
    tempList.sort((a, b) {
      return b.orderAtFormatted!.compareTo(a.orderAtFormatted!);
    });
    _filteredOrderList = tempList.toSet().toList();
    print('filteredOrderList: ${_filteredOrderList.length}');
    notifyListeners();
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
    final tempList = orders.where((element) {
      if (element.orderAtFormatted == null) {
        return false;
      }
      return element.orderAtFormatted!.isAfter(timeDiff);
    }).toList();
    return tempList;
  }
}
