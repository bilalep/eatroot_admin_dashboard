import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:tech_test/models/order_details/address.dart';
import 'package:tech_test/models/order_details/customer.dart';
import 'package:tech_test/models/order_details/discount.dart';
import 'package:tech_test/models/order_details/item.dart';
import 'package:tech_test/models/order_details/status_history.dart';

class OrderDetail extends Equatable {
  const OrderDetail({
    this.id,
    this.orderNo,
    this.outletId,
    this.outletName,
    this.channel,
    this.note,
    this.orderingService,
    this.paymentMethod,
    this.totalItems,
    this.taxType,
    this.taxPercent,
    this.trnNo,
    this.outletPreparationTime,
    this.preparationTime,
    this.actualSubTotal,
    this.subTotal,
    this.totalWithTax,
    this.totalWithoutTax,
    this.tax,
    this.deliveryFee,
    this.amountToPay,
    this.redeemedAmount,
    this.finalAmount,
    this.discount,
    this.orderedAt,
    this.deliveryAt,
    this.status,
    this.statusHistory,
    this.cancelled,
    this.cancellationReason,
    this.customerTotalOrder,
    this.customer,
    this.address,
    this.pickupCustomerArrived,
    this.pickupCustomerNote,
    this.pickupFullfilled,
    this.items,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OrderDetail].
  factory OrderDetail.fromJson(String data) {
    return OrderDetail.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory OrderDetail.fromMap(Map<String, dynamic> data) => OrderDetail(
        id: data['id'] as int?,
        orderNo: data['order_no'] as String?,
        outletId: data['outlet_id'] as int?,
        outletName: data['outlet_name'] as String?,
        channel: data['channel'] as String?,
        note: data['note'] as dynamic,
        orderingService: data['ordering_service'] as String?,
        paymentMethod: data['payment_method'] as String?,
        totalItems: data['total_items'] as String?,
        taxType: data['tax_type'] as String?,
        taxPercent: data['tax_percent'] as String?,
        trnNo: data['trn_no'] as dynamic,
        outletPreparationTime: data['outlet_preparation_time'] as int?,
        preparationTime: data['preparation_time'] as dynamic,
        actualSubTotal: data['actual_sub_total'] as String?,
        subTotal: data['sub_total'] as String?,
        totalWithTax: data['total_with_tax'] as String?,
        totalWithoutTax: data['total_without_tax'] as String?,
        tax: data['tax'] as String?,
        deliveryFee: data['delivery_fee'] as String?,
        amountToPay: data['amount_to_pay'] as String?,
        redeemedAmount: data['redeemed_amount'] as String?,
        finalAmount: data['final_amount'] as String?,
        discount: data['discount'] == null
            ? null
            : Discount.fromMap(data['discount'] as Map<String, dynamic>),
        orderedAt: data['ordered_at'] as String?,
        deliveryAt: data['delivery_at'] as String?,
        status: data['status'] as String?,
        statusHistory: (data['status_history'] as List<dynamic>?)
            ?.map(
              (dynamic e) => StatusHistory.fromMap(e as Map<String, dynamic>),
            )
            .toList(),
        cancelled: data['cancelled'] as bool?,
        cancellationReason: data['cancellation_reason'] as dynamic,
        customerTotalOrder: data['customer_total_order'] as int?,
        customer: data['customer'] == null
            ? null
            : Customer.fromMap(data['customer'] as Map<String, dynamic>),
        address: data['address'] == null
            ? null
            : Address.fromMap(data['address'] as Map<String, dynamic>),
        pickupCustomerArrived: data['pickup_customer_arrived'] as bool?,
        pickupCustomerNote: data['pickup_customer_note'] as dynamic,
        pickupFullfilled: data['pickup_fullfilled'] as bool?,
        items: (data['items'] as List<dynamic>?)
            ?.map((dynamic e) => Item.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  final String? actualSubTotal;
  final Address? address;
  final String? amountToPay;
  final dynamic cancellationReason;
  final bool? cancelled;
  final String? channel;
  final Customer? customer;
  final int? customerTotalOrder;
  final String? deliveryAt;
  final String? deliveryFee;
  final Discount? discount;
  final String? finalAmount;
  final int? id;
  final List<Item>? items;
  final dynamic note;
  final String? orderNo;
  final String? orderedAt;
  final String? orderingService;
  final int? outletId;
  final String? outletName;
  final int? outletPreparationTime;
  final String? paymentMethod;
  final bool? pickupCustomerArrived;
  final dynamic pickupCustomerNote;
  final bool? pickupFullfilled;
  final dynamic preparationTime;
  final String? redeemedAmount;
  final String? status;
  final List<StatusHistory>? statusHistory;
  final String? subTotal;
  final String? tax;
  final String? taxPercent;
  final String? taxType;
  final String? totalItems;
  final String? totalWithTax;
  final String? totalWithoutTax;
  final dynamic trnNo;

  @override
  List<Object?> get props {
    return [
      id,
      orderNo,
      outletId,
      outletName,
      channel,
      note,
      orderingService,
      paymentMethod,
      totalItems,
      taxType,
      taxPercent,
      trnNo,
      outletPreparationTime,
      preparationTime,
      actualSubTotal,
      subTotal,
      totalWithTax,
      totalWithoutTax,
      tax,
      deliveryFee,
      amountToPay,
      redeemedAmount,
      finalAmount,
      discount,
      orderedAt,
      deliveryAt,
      status,
      statusHistory,
      cancelled,
      cancellationReason,
      customerTotalOrder,
      customer,
      address,
      pickupCustomerArrived,
      pickupCustomerNote,
      pickupFullfilled,
      items,
    ];
  }

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'order_no': orderNo,
        'outlet_id': outletId,
        'outlet_name': outletName,
        'channel': channel,
        'note': note,
        'ordering_service': orderingService,
        'payment_method': paymentMethod,
        'total_items': totalItems,
        'tax_type': taxType,
        'tax_percent': taxPercent,
        'trn_no': trnNo,
        'outlet_preparation_time': outletPreparationTime,
        'preparation_time': preparationTime,
        'actual_sub_total': actualSubTotal,
        'sub_total': subTotal,
        'total_with_tax': totalWithTax,
        'total_without_tax': totalWithoutTax,
        'tax': tax,
        'delivery_fee': deliveryFee,
        'amount_to_pay': amountToPay,
        'redeemed_amount': redeemedAmount,
        'final_amount': finalAmount,
        'discount': discount?.toMap(),
        'ordered_at': orderedAt,
        'delivery_at': deliveryAt,
        'status': status,
        'status_history': statusHistory?.map((e) => e.toMap()).toList(),
        'cancelled': cancelled,
        'cancellation_reason': cancellationReason,
        'customer_total_order': customerTotalOrder,
        'customer': customer?.toMap(),
        'address': address?.toMap(),
        'pickup_customer_arrived': pickupCustomerArrived,
        'pickup_customer_note': pickupCustomerNote,
        'pickup_fullfilled': pickupFullfilled,
        'items': items?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Converts [OrderDetail] to a JSON string.
  String toJson() => json.encode(toMap());

  OrderDetail copyWith({
    int? id,
    String? orderNo,
    int? outletId,
    String? outletName,
    String? channel,
    dynamic note,
    String? orderingService,
    String? paymentMethod,
    String? totalItems,
    String? taxType,
    String? taxPercent,
    dynamic trnNo,
    int? outletPreparationTime,
    dynamic preparationTime,
    String? actualSubTotal,
    String? subTotal,
    String? totalWithTax,
    String? totalWithoutTax,
    String? tax,
    String? deliveryFee,
    String? amountToPay,
    String? redeemedAmount,
    String? finalAmount,
    Discount? discount,
    String? orderedAt,
    String? deliveryAt,
    String? status,
    List<StatusHistory>? statusHistory,
    bool? cancelled,
    dynamic cancellationReason,
    int? customerTotalOrder,
    Customer? customer,
    Address? address,
    bool? pickupCustomerArrived,
    dynamic pickupCustomerNote,
    bool? pickupFullfilled,
    List<Item>? items,
  }) {
    return OrderDetail(
      id: id ?? this.id,
      orderNo: orderNo ?? this.orderNo,
      outletId: outletId ?? this.outletId,
      outletName: outletName ?? this.outletName,
      channel: channel ?? this.channel,
      note: note ?? this.note,
      orderingService: orderingService ?? this.orderingService,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      totalItems: totalItems ?? this.totalItems,
      taxType: taxType ?? this.taxType,
      taxPercent: taxPercent ?? this.taxPercent,
      trnNo: trnNo ?? this.trnNo,
      outletPreparationTime:
          outletPreparationTime ?? this.outletPreparationTime,
      preparationTime: preparationTime ?? this.preparationTime,
      actualSubTotal: actualSubTotal ?? this.actualSubTotal,
      subTotal: subTotal ?? this.subTotal,
      totalWithTax: totalWithTax ?? this.totalWithTax,
      totalWithoutTax: totalWithoutTax ?? this.totalWithoutTax,
      tax: tax ?? this.tax,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      amountToPay: amountToPay ?? this.amountToPay,
      redeemedAmount: redeemedAmount ?? this.redeemedAmount,
      finalAmount: finalAmount ?? this.finalAmount,
      discount: discount ?? this.discount,
      orderedAt: orderedAt ?? this.orderedAt,
      deliveryAt: deliveryAt ?? this.deliveryAt,
      status: status ?? this.status,
      statusHistory: statusHistory ?? this.statusHistory,
      cancelled: cancelled ?? this.cancelled,
      cancellationReason: cancellationReason ?? this.cancellationReason,
      customerTotalOrder: customerTotalOrder ?? this.customerTotalOrder,
      customer: customer ?? this.customer,
      address: address ?? this.address,
      pickupCustomerArrived:
          pickupCustomerArrived ?? this.pickupCustomerArrived,
      pickupCustomerNote: pickupCustomerNote ?? this.pickupCustomerNote,
      pickupFullfilled: pickupFullfilled ?? this.pickupFullfilled,
      items: items ?? this.items,
    );
  }
}
