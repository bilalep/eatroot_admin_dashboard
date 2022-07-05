import 'dart:convert';

import 'package:equatable/equatable.dart';

class PaymentMethod extends Equatable {
  const PaymentMethod({this.id, this.method, this.delivery, this.pickup});

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PaymentMethod].
  factory PaymentMethod.fromJson(String data) {
    return PaymentMethod.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory PaymentMethod.fromMap(Map<String, dynamic> data) => PaymentMethod(
        id: data['id'] as int?,
        method: data['method'] as String?,
        delivery: data['delivery'] as int?,
        pickup: data['pickup'] as int?,
      );

  final int? delivery;
  final int? id;
  final String? method;
  final int? pickup;

  @override
  List<Object?> get props => [id, method, delivery, pickup];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'method': method,
        'delivery': delivery,
        'pickup': pickup,
      };

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
}
