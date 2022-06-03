import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:tech_test/models/order_list/address.dart';
import 'package:tech_test/models/order_list/customer.dart';

class Order extends Equatable {
  const Order({
    this.id,
    this.orderNo,
    this.channel,
    this.preparationTime,
    this.orderingService,
    this.paymentMethod,
    this.status,
    this.orderAt,
    this.deliveryAt,
    this.customer,
    this.address,
    this.discountCoupon,
    this.actualSubTotal,
    this.subTotal,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Order].
  factory Order.fromJson(String data) {
    return Order.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory Order.fromMap(Map<String, dynamic> data) => Order(
        id: data['id'] as int?,
        orderNo: data['order_no'] as String?,
        channel: data['channel'] as String?,
        preparationTime: data['preparation_time'] as dynamic,
        orderingService: data['ordering_service'] as String?,
        paymentMethod: data['payment_method'] as String?,
        status: data['status'] as String?,
        orderAt: data['order_at'] as String?,
        deliveryAt: data['delivery_at'] as String?,
        customer: data['customer'] == null
            ? null
            : Customer.fromMap(data['customer'] as Map<String, dynamic>),
        address: data['address'] == null
            ? null
            : Address.fromMap(data['address'] as Map<String, dynamic>),
        discountCoupon: data['discount_coupon'] as dynamic,
        actualSubTotal: data['actual_sub_total'] as String?,
        subTotal: data['sub_total'] as String?,
      );

  final String? actualSubTotal;
  final Address? address;
  final String? channel;
  final Customer? customer;
  final String? deliveryAt;
  final dynamic discountCoupon;
  final int? id;
  final String? orderAt;
  final String? orderNo;
  final String? orderingService;
  final String? paymentMethod;
  final dynamic preparationTime;
  final String? status;
  final String? subTotal;

  @override
  List<Object?> get props {
    return [
      id,
      orderNo,
      channel,
      preparationTime,
      orderingService,
      paymentMethod,
      status,
      orderAt,
      deliveryAt,
      customer,
      address,
      discountCoupon,
      actualSubTotal,
      subTotal,
    ];
  }

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'order_no': orderNo,
        'channel': channel,
        'preparation_time': preparationTime,
        'ordering_service': orderingService,
        'payment_method': paymentMethod,
        'status': status,
        'order_at': orderAt,
        'delivery_at': deliveryAt,
        'customer': customer?.toMap(),
        'address': address?.toMap(),
        'discount_coupon': discountCoupon,
        'actual_sub_total': actualSubTotal,
        'sub_total': subTotal,
      };

  /// `dart:convert`
  ///
  /// Converts [Order] to a JSON string.
  String toJson() => json.encode(toMap());

  Order copyWith({
    int? id,
    String? orderNo,
    String? channel,
    dynamic preparationTime,
    String? orderingService,
    String? paymentMethod,
    String? status,
    String? orderAt,
    String? deliveryAt,
    Customer? customer,
    Address? address,
    dynamic discountCoupon,
    String? actualSubTotal,
    String? subTotal,
  }) {
    return Order(
      id: id ?? this.id,
      orderNo: orderNo ?? this.orderNo,
      channel: channel ?? this.channel,
      preparationTime: preparationTime ?? this.preparationTime,
      orderingService: orderingService ?? this.orderingService,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      status: status ?? this.status,
      orderAt: orderAt ?? this.orderAt,
      deliveryAt: deliveryAt ?? this.deliveryAt,
      customer: customer ?? this.customer,
      address: address ?? this.address,
      discountCoupon: discountCoupon ?? this.discountCoupon,
      actualSubTotal: actualSubTotal ?? this.actualSubTotal,
      subTotal: subTotal ?? this.subTotal,
    );
  }
}
