import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tech_test/models/order_details/order_detail.dart';
import 'package:tech_test/models/order_details/order_details.dart';
import 'package:tech_test/models/order_list/order.dart';
import 'package:tech_test/models/order_list/order_list.dart';
import 'package:tech_test/providers/order_detail_provider.dart';
import 'package:tech_test/services/api_service_helpers.dart';
import 'package:tech_test/utils/constants.dart';

class ApiService {
  Future<List<Order>?> getLiveOrderListFromApi() async {
    final response = await callApi('GET', 'orders/live');
    final responseString = await checkResponseStatus(response);
    if (responseString != null) {
      return OrderList.fromJson(responseString).order;
    } else {
      return null;
    }
  }

  Future<OrderDetail?> getOrderDetailsFromId(int id) async {
    final response = await callApi('GET', 'orders/detail/$id');

    final responseString = await checkResponseStatus(response);
    if (responseString != null) {
      return OrderDetails.fromJson(responseString).orderDetail;
    } else {
      return null;
    }
  }

  Future changeOrderStatusById(int orderId, int statusId) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': kBearerToken
    };
    final request = http.Request(
      'POST',
      Uri.parse('$endpoint/orders/change-status'),
    )..body = json.encode({'order_id': '$orderId', 'status_id': '$statusId'});
    request.headers.addAll(headers);
    print(request.body);

    final response = await request.send();

    if (response.statusCode == 200) {
      log('status changed');
    } else {
      log('Status change error: ${response.reasonPhrase}');
    }

    final orderDetailsProvider = OrderDetailsProvider();
    await orderDetailsProvider.getOrderDetailsFromId(orderId);
  }
}
