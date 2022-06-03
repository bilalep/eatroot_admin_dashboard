import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'order_detail.dart';

class OrderDetails extends Equatable {
  final OrderDetail? orderDetail;

  const OrderDetails({this.orderDetail});

  factory OrderDetails.fromMap(Map<String, dynamic> data) => OrderDetails(
        orderDetail: data['order_detail'] == null
            ? null
            : OrderDetail.fromMap(data['order_detail'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'order_detail': orderDetail?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OrderDetails].
  factory OrderDetails.fromJson(String data) {
    return OrderDetails.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OrderDetails] to a JSON string.
  String toJson() => json.encode(toMap());

  OrderDetails copyWith({
    OrderDetail? orderDetail,
  }) {
    return OrderDetails(
      orderDetail: orderDetail ?? this.orderDetail,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [orderDetail];
}
