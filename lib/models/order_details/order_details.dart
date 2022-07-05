import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:tech_test/models/order_details/order_detail.dart';

class OrderDetails extends Equatable {
  const OrderDetails({this.orderDetail});

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OrderDetails].
  factory OrderDetails.fromJson(String data) {
    return OrderDetails.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory OrderDetails.fromMap(Map<String, dynamic> data) {
    return OrderDetails(
      orderDetail: data['order_detail'] == null
          ? null
          : OrderDetail.fromMap(data['order_detail'] as Map<String, dynamic>),
    );
  }

  final OrderDetail? orderDetail;

  @override
  List<Object?> get props => [orderDetail];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'order_detail': orderDetail?.toMap(),
      };

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
}
