import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:tech_test/models/base_user/loyalty_config.dart';

class Settings extends Equatable {
  const Settings({
    this.id,
    this.otpVerification,
    this.orderAcceptSms,
    this.pickupReadySms,
    this.orderDeliverySms,
    this.orderReviewEmail,
    this.smsSenderId,
    this.paymentGateway,
    this.hasLoyalty,
    this.loyaltyConfig,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Settings].
  factory Settings.fromJson(String data) {
    return Settings.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory Settings.fromMap(Map<String, dynamic> data) => Settings(
        id: data['id'] as int?,
        otpVerification: data['otp_verification'] as int?,
        orderAcceptSms: data['order_accept_sms'] as int?,
        pickupReadySms: data['pickup_ready_sms'] as int?,
        orderDeliverySms: data['order_delivery_sms'] as int?,
        orderReviewEmail: data['order_review_email'] as int?,
        smsSenderId: data['sms_sender_id'] as String?,
        paymentGateway: data['payment_gateway'] as String?,
        hasLoyalty: data['has_loyalty'] as int?,
        loyaltyConfig: data['loyalty_config'] == null
            ? null
            : LoyaltyConfig.fromMap(
                data['loyalty_config'] as Map<String, dynamic>,
              ),
      );

  final int? hasLoyalty;
  final int? id;
  final LoyaltyConfig? loyaltyConfig;
  final int? orderAcceptSms;
  final int? orderDeliverySms;
  final int? orderReviewEmail;
  final int? otpVerification;
  final String? paymentGateway;
  final int? pickupReadySms;
  final String? smsSenderId;

  @override
  List<Object?> get props {
    return [
      id,
      otpVerification,
      orderAcceptSms,
      pickupReadySms,
      orderDeliverySms,
      orderReviewEmail,
      smsSenderId,
      paymentGateway,
      hasLoyalty,
      loyaltyConfig,
    ];
  }

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'otp_verification': otpVerification,
        'order_accept_sms': orderAcceptSms,
        'pickup_ready_sms': pickupReadySms,
        'order_delivery_sms': orderDeliverySms,
        'order_review_email': orderReviewEmail,
        'sms_sender_id': smsSenderId,
        'payment_gateway': paymentGateway,
        'has_loyalty': hasLoyalty,
        'loyalty_config': loyaltyConfig?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Converts [Settings] to a JSON string.
  String toJson() => json.encode(toMap());

  Settings copyWith({
    int? id,
    int? otpVerification,
    int? orderAcceptSms,
    int? pickupReadySms,
    int? orderDeliverySms,
    int? orderReviewEmail,
    String? smsSenderId,
    String? paymentGateway,
    int? hasLoyalty,
    LoyaltyConfig? loyaltyConfig,
  }) {
    return Settings(
      id: id ?? this.id,
      otpVerification: otpVerification ?? this.otpVerification,
      orderAcceptSms: orderAcceptSms ?? this.orderAcceptSms,
      pickupReadySms: pickupReadySms ?? this.pickupReadySms,
      orderDeliverySms: orderDeliverySms ?? this.orderDeliverySms,
      orderReviewEmail: orderReviewEmail ?? this.orderReviewEmail,
      smsSenderId: smsSenderId ?? this.smsSenderId,
      paymentGateway: paymentGateway ?? this.paymentGateway,
      hasLoyalty: hasLoyalty ?? this.hasLoyalty,
      loyaltyConfig: loyaltyConfig ?? this.loyaltyConfig,
    );
  }
}
