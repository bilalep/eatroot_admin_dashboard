import 'dart:convert';

import 'package:equatable/equatable.dart';

class PaymentMethod extends Equatable {
  final int? id;
  final String? method;
  final int? delivery;
  final int? pickup;

  const PaymentMethod({this.id, this.method, this.delivery, this.pickup});

  factory PaymentMethod.fromMap(Map<String, dynamic> data) => PaymentMethod(
        id: data['id'] as int?,
        method: data['method'] as String?,
        delivery: data['delivery'] as int?,
        pickup: data['pickup'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'method': method,
        'delivery': delivery,
        'pickup': pickup,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PaymentMethod].
  factory PaymentMethod.fromJson(String data) {
    return PaymentMethod.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PaymentMethod] to a JSON string.
  String toJson() => json.encode(toMap());

  PaymentMethod copyWith({
    int? id,
    String? method,
    int? delivery,
    int? pickup,
  }) {
    return PaymentMethod(
      id: id ?? this.id,
      method: method ?? this.method,
      delivery: delivery ?? this.delivery,
      pickup: pickup ?? this.pickup,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, method, delivery, pickup];
}
