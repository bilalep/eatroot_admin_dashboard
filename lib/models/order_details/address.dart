import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:tech_test/models/order_details/custom_note.dart';
import 'package:tech_test/models/order_details/payment_method.dart';

class Address extends Equatable {
  const Address({
    this.id,
    this.addressTypeId,
    this.addressType,
    this.address1,
    this.address,
    this.nameEn,
    this.nameAr,
    this.addressEn,
    this.addressAr,
    this.lat,
    this.lng,
    this.phone1,
    this.phone2,
    this.email,
    this.mobile,
    this.whatsapp,
    this.timezoneId,
    this.timezone,
    this.deliveryPaused,
    this.pickupPaused,
    this.hasDelivery,
    this.deliveryFee,
    this.deliveryTime,
    this.deliveryMinOrder,
    this.hasPickup,
    this.pickupFee,
    this.customNote,
    this.paymentMethods,
    this.payOnline,
    this.cashOnDelivery,
    this.cardOnDelivery,
    this.cashOnPickup,
    this.cardOnPickup,
    this.pickupMinOrder,
    this.pickupAlert,
    this.preparationTime,
    this.inclusiveTax,
    this.taxRate,
    this.status,
    this.image,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Address].
  factory Address.fromJson(String data) {
    return Address.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory Address.fromMap(Map<String, dynamic> data) => Address(
        id: data['id'] as int?,
        addressTypeId: data['address_type_id'] as int?,
        addressType: data['address_type'] as String?,
        address1: data['address_1'] as dynamic,
        address: data['address'] as String?,
        nameEn: data['name_en'] as String?,
        nameAr: data['name_ar'] as String?,
        addressEn: data['address_en'] as String?,
        addressAr: data['address_ar'] as String?,
        lat: data['lat'] as dynamic,
        lng: data['lng'] as dynamic,
        phone1: data['phone_1'] as String?,
        phone2: data['phone_2'] as dynamic,
        email: data['email'] as dynamic,
        mobile: data['mobile'] as String?,
        whatsapp: data['whatsapp'] as String?,
        timezoneId: data['timezone_id'] as int?,
        timezone: data['timezone'] as String?,
        deliveryPaused: data['delivery_paused'] as bool?,
        pickupPaused: data['pickup_paused'] as bool?,
        hasDelivery: data['has_delivery'] as int?,
        deliveryFee: data['delivery_fee'] as String?,
        deliveryTime: data['delivery_time'] as int?,
        deliveryMinOrder: data['delivery_min_order'] as String?,
        hasPickup: data['has_pickup'] as int?,
        pickupFee: data['pickup_fee'] as String?,
        customNote: data['custom_note'] == null
            ? null
            : CustomNote.fromMap(data['custom_note'] as Map<String, dynamic>),
        paymentMethods: (data['payment_methods'] as List<dynamic>?)
            ?.map(
              (dynamic e) => PaymentMethod.fromMap(e as Map<String, dynamic>),
            )
            .toList(),
        payOnline: data['pay_online'] as int?,
        cashOnDelivery: data['cash_on_delivery'] as int?,
        cardOnDelivery: data['card_on_delivery'] as int?,
        cashOnPickup: data['cash_on_pickup'] as int?,
        cardOnPickup: data['card_on_pickup'] as int?,
        pickupMinOrder: data['pickup_min_order'] as String?,
        pickupAlert: data['pickup_alert'] as bool?,
        preparationTime: data['preparation_time'] as int?,
        inclusiveTax: data['inclusive_tax'] as int?,
        taxRate: data['tax_rate'] as String?,
        status: data['status'] as String?,
        image: data['image'] as dynamic,
      );

  final String? address;
  final dynamic address1;
  final String? addressAr;
  final String? addressEn;
  final String? addressType;
  final int? addressTypeId;
  final int? cardOnDelivery;
  final int? cardOnPickup;
  final int? cashOnDelivery;
  final int? cashOnPickup;
  final CustomNote? customNote;
  final String? deliveryFee;
  final String? deliveryMinOrder;
  final bool? deliveryPaused;
  final int? deliveryTime;
  final dynamic email;
  final int? hasDelivery;
  final int? hasPickup;
  final int? id;
  final dynamic image;
  final int? inclusiveTax;
  final dynamic lat;
  final dynamic lng;
  final String? mobile;
  final String? nameAr;
  final String? nameEn;
  final int? payOnline;
  final List<PaymentMethod>? paymentMethods;
  final String? phone1;
  final dynamic phone2;
  final bool? pickupAlert;
  final String? pickupFee;
  final String? pickupMinOrder;
  final bool? pickupPaused;
  final int? preparationTime;
  final String? status;
  final String? taxRate;
  final String? timezone;
  final int? timezoneId;
  final String? whatsapp;

  @override
  List<Object?> get props {
    return [
      id,
      addressTypeId,
      addressType,
      address1,
      address,
      nameEn,
      nameAr,
      addressEn,
      addressAr,
      lat,
      lng,
      phone1,
      phone2,
      email,
      mobile,
      whatsapp,
      timezoneId,
      timezone,
      deliveryPaused,
      pickupPaused,
      hasDelivery,
      deliveryFee,
      deliveryTime,
      deliveryMinOrder,
      hasPickup,
      pickupFee,
      customNote,
      paymentMethods,
      payOnline,
      cashOnDelivery,
      cardOnDelivery,
      cashOnPickup,
      cardOnPickup,
      pickupMinOrder,
      pickupAlert,
      preparationTime,
      inclusiveTax,
      taxRate,
      status,
      image,
    ];
  }

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'address_type_id': addressTypeId,
        'address_type': addressType,
        'address_1': address1,
        'address': address,
        'name_en': nameEn,
        'name_ar': nameAr,
        'address_en': addressEn,
        'address_ar': addressAr,
        'lat': lat,
        'lng': lng,
        'phone_1': phone1,
        'phone_2': phone2,
        'email': email,
        'mobile': mobile,
        'whatsapp': whatsapp,
        'timezone_id': timezoneId,
        'timezone': timezone,
        'delivery_paused': deliveryPaused,
        'pickup_paused': pickupPaused,
        'has_delivery': hasDelivery,
        'delivery_fee': deliveryFee,
        'delivery_time': deliveryTime,
        'delivery_min_order': deliveryMinOrder,
        'has_pickup': hasPickup,
        'pickup_fee': pickupFee,
        'custom_note': customNote?.toMap(),
        'payment_methods': paymentMethods?.map((e) => e.toMap()).toList(),
        'pay_online': payOnline,
        'cash_on_delivery': cashOnDelivery,
        'card_on_delivery': cardOnDelivery,
        'cash_on_pickup': cashOnPickup,
        'card_on_pickup': cardOnPickup,
        'pickup_min_order': pickupMinOrder,
        'pickup_alert': pickupAlert,
        'preparation_time': preparationTime,
        'inclusive_tax': inclusiveTax,
        'tax_rate': taxRate,
        'status': status,
        'image': image,
      };

  /// `dart:convert`
  ///
  /// Converts [Address] to a JSON string.
  String toJson() => json.encode(toMap());

  Address copyWith({
    int? id,
    int? addressTypeId,
    String? addressType,
    dynamic address1,
    String? address,
    String? nameEn,
    String? nameAr,
    String? addressEn,
    String? addressAr,
    dynamic lat,
    dynamic lng,
    String? phone1,
    dynamic phone2,
    dynamic email,
    String? mobile,
    String? whatsapp,
    int? timezoneId,
    String? timezone,
    bool? deliveryPaused,
    bool? pickupPaused,
    int? hasDelivery,
    String? deliveryFee,
    int? deliveryTime,
    String? deliveryMinOrder,
    int? hasPickup,
    String? pickupFee,
    CustomNote? customNote,
    List<PaymentMethod>? paymentMethods,
    int? payOnline,
    int? cashOnDelivery,
    int? cardOnDelivery,
    int? cashOnPickup,
    int? cardOnPickup,
    String? pickupMinOrder,
    bool? pickupAlert,
    int? preparationTime,
    int? inclusiveTax,
    String? taxRate,
    String? status,
    dynamic image,
  }) {
    return Address(
      id: id ?? this.id,
      addressTypeId: addressTypeId ?? this.addressTypeId,
      addressType: addressType ?? this.addressType,
      address1: address1 ?? this.address1,
      address: address ?? this.address,
      nameEn: nameEn ?? this.nameEn,
      nameAr: nameAr ?? this.nameAr,
      addressEn: addressEn ?? this.addressEn,
      addressAr: addressAr ?? this.addressAr,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      phone1: phone1 ?? this.phone1,
      phone2: phone2 ?? this.phone2,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      whatsapp: whatsapp ?? this.whatsapp,
      timezoneId: timezoneId ?? this.timezoneId,
      timezone: timezone ?? this.timezone,
      deliveryPaused: deliveryPaused ?? this.deliveryPaused,
      pickupPaused: pickupPaused ?? this.pickupPaused,
      hasDelivery: hasDelivery ?? this.hasDelivery,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      deliveryMinOrder: deliveryMinOrder ?? this.deliveryMinOrder,
      hasPickup: hasPickup ?? this.hasPickup,
      pickupFee: pickupFee ?? this.pickupFee,
      customNote: customNote ?? this.customNote,
      paymentMethods: paymentMethods ?? this.paymentMethods,
      payOnline: payOnline ?? this.payOnline,
      cashOnDelivery: cashOnDelivery ?? this.cashOnDelivery,
      cardOnDelivery: cardOnDelivery ?? this.cardOnDelivery,
      cashOnPickup: cashOnPickup ?? this.cashOnPickup,
      cardOnPickup: cardOnPickup ?? this.cardOnPickup,
      pickupMinOrder: pickupMinOrder ?? this.pickupMinOrder,
      pickupAlert: pickupAlert ?? this.pickupAlert,
      preparationTime: preparationTime ?? this.preparationTime,
      inclusiveTax: inclusiveTax ?? this.inclusiveTax,
      taxRate: taxRate ?? this.taxRate,
      status: status ?? this.status,
      image: image ?? this.image,
    );
  }
}
