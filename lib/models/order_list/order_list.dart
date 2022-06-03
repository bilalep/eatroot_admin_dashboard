import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'order.dart';

class OrderList extends Equatable {
  final List<Order>? order;

  const OrderList({this.order});

  factory OrderList.fromMap(Map<String, dynamic> data) => OrderList(
        order: (data['data'] as List<dynamic>?)
            ?.map((dynamic e) => Order.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'data': order?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OrderList].
  factory OrderList.fromJson(String data) {
    return OrderList.fromMap(json.decode(data) as Map<String, dynamic>);
  }

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

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [order];
}
