import 'dart:convert';

import 'package:equatable/equatable.dart';

class LoyaltyConfig extends Equatable {
  const LoyaltyConfig({
    this.restaurantId,
    this.deliveryCashBack,
    this.pickupCashBack,
    this.walkinCashBack,
    this.pointExpiryDays,
    this.minRedeemAmount,
    this.maxRedeemAmount,
    this.hasPickup,
    this.hasDelivery,
    this.hasWalkin,
    this.earnOnDeliveryCharge,
    this.redeemOnDeliveryCharge,
    this.q,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LoyaltyConfig]
  factory LoyaltyConfig.fromJson(String data) {
    return LoyaltyConfig.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory LoyaltyConfig.fromMap(Map<String, dynamic> data) => LoyaltyConfig(
        restaurantId: data['restaurant_id'] as String?,
        deliveryCashBack: data['deliveryCashBack'] as String?,
        pickupCashBack: data['pickupCashBack'] as String?,
        walkinCashBack: data['walkinCashBack'] as String?,
        pointExpiryDays: data['pointExpiryDays'] as String?,
        minRedeemAmount: data['minRedeemAmount'] as String?,
        maxRedeemAmount: data['maxRedeemAmount'] as dynamic,
        hasPickup: data['hasPickup'] as String?,
        hasDelivery: data['hasDelivery'] as String?,
        hasWalkin: data['hasWalkin'] as String?,
        earnOnDeliveryCharge: data['earnOnDeliveryCharge'] as String?,
        redeemOnDeliveryCharge: data['redeemOnDeliveryCharge'] as String?,
        q: data['q'] as String?,
      );

  final String? deliveryCashBack;
  final String? earnOnDeliveryCharge;
  final String? hasDelivery;
  final String? hasPickup;
  final String? hasWalkin;
  final dynamic maxRedeemAmount;
  final String? minRedeemAmount;
  final String? pickupCashBack;
  final String? pointExpiryDays;
  final String? q;
  final String? redeemOnDeliveryCharge;
  final String? restaurantId;
  final String? walkinCashBack;

  @override
  List<Object?> get props {
    return [
      restaurantId,
      deliveryCashBack,
      pickupCashBack,
      walkinCashBack,
      pointExpiryDays,
      minRedeemAmount,
      maxRedeemAmount,
      hasPickup,
      hasDelivery,
      hasWalkin,
      earnOnDeliveryCharge,
      redeemOnDeliveryCharge,
      q,
    ];
  }

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'restaurant_id': restaurantId,
        'deliveryCashBack': deliveryCashBack,
        'pickupCashBack': pickupCashBack,
        'walkinCashBack': walkinCashBack,
        'pointExpiryDays': pointExpiryDays,
        'minRedeemAmount': minRedeemAmount,
        'maxRedeemAmount': maxRedeemAmount,
        'hasPickup': hasPickup,
        'hasDelivery': hasDelivery,
        'hasWalkin': hasWalkin,
        'earnOnDeliveryCharge': earnOnDeliveryCharge,
        'redeemOnDeliveryCharge': redeemOnDeliveryCharge,
        'q': q,
      };

  /// `dart:convert`
  ///
  /// Converts [LoyaltyConfig] to a JSON string.
  String toJson() => json.encode(toMap());

  LoyaltyConfig copyWith({
    String? restaurantId,
    String? deliveryCashBack,
    String? pickupCashBack,
    String? walkinCashBack,
    String? pointExpiryDays,
    String? minRedeemAmount,
    dynamic maxRedeemAmount,
    String? hasPickup,
    String? hasDelivery,
    String? hasWalkin,
    String? earnOnDeliveryCharge,
    String? redeemOnDeliveryCharge,
    String? q,
  }) {
    return LoyaltyConfig(
      restaurantId: restaurantId ?? this.restaurantId,
      deliveryCashBack: deliveryCashBack ?? this.deliveryCashBack,
      pickupCashBack: pickupCashBack ?? this.pickupCashBack,
      walkinCashBack: walkinCashBack ?? this.walkinCashBack,
      pointExpiryDays: pointExpiryDays ?? this.pointExpiryDays,
      minRedeemAmount: minRedeemAmount ?? this.minRedeemAmount,
      maxRedeemAmount: maxRedeemAmount ?? this.maxRedeemAmount,
      hasPickup: hasPickup ?? this.hasPickup,
      hasDelivery: hasDelivery ?? this.hasDelivery,
      hasWalkin: hasWalkin ?? this.hasWalkin,
      earnOnDeliveryCharge: earnOnDeliveryCharge ?? this.earnOnDeliveryCharge,
      redeemOnDeliveryCharge:
          redeemOnDeliveryCharge ?? this.redeemOnDeliveryCharge,
      q: q ?? this.q,
    );
  }
}
