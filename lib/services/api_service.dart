import 'dart:convert';

import 'package:tech_test/models/order_details/order_detail.dart';
import 'package:tech_test/models/order_list/order.dart';
import 'package:tech_test/providers/order_detail_provider.dart';
import 'package:tech_test/utils/constants.dart';

import '../models/order_details/order_details.dart';
import '../models/order_list/order_list.dart';
import 'package:http/http.dart' as http;

import 'api_service_helpers.dart';

class ApiService {
  Future<List<Order>?> getLiveOrderListFromApi() async {
    http.StreamedResponse response = await callApi('GET', 'orders/live');
    final responseString = await checkResponseStatus(response);
    if (responseString != null) {
      return OrderList.fromJson(responseString).order;
    } else {
      return null;
    }
  }

  Future<OrderDetail?> getOrderDetailsFromId(int id) async {
    http.StreamedResponse response = await callApi('GET', 'orders/detail/$id');

    final responseString = await checkResponseStatus(response);
    if (responseString != null) {
      return OrderDetails.fromJson(responseString).orderDetail;
    } else {
      return null;
    }
  }

  Future changeOrderStatusById(int orderId, int statusId) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': kBearerToken
    };
    var request =
        http.Request('POST', Uri.parse('$endpoint/orders/change-status'));
    request.body =
        json.encode({"order_id": "$orderId", "status_id": "$statusId"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }

    OrderDetailsProvider orderDetailsProvider = OrderDetailsProvider();
    await orderDetailsProvider.getOrderDetailsFromId(orderId);
  }
}
