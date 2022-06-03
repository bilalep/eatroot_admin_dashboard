import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:tech_test/models/order_list/order.dart';

class OrderList extends Equatable {
  const OrderList({this.order});

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OrderList].
  factory OrderList.fromJson(String data) {
    return OrderList.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory OrderList.fromMap(Map<String, dynamic> data) => OrderList(
        order: (data['data'] as List<dynamic>?)
            ?.map((dynamic e) => Order.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  final List<Order>? order;

  @override
  List<Object?> get props => [order];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'data': order?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Converts [OrderList] to a JSON string.
  String toJson() => json.encode(toMap());

  OrderList copyWith({
    List<Order>? data,
  }) {
    return OrderList(
      order: data ?? order,
    );
  }
}
