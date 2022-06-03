import 'dart:convert';

import 'package:equatable/equatable.dart';

class Discount extends Equatable {
  final bool? hasDiscount;
  final dynamic id;
  final dynamic code;
  final dynamic value;
  final String? amount;

  const Discount({
    this.hasDiscount,
    this.id,
    this.code,
    this.value,
    this.amount,
  });

  factory Discount.fromMap(Map<String, dynamic> data) => Discount(
        hasDiscount: data['has_discount'] as bool?,
        id: data['id'] as dynamic,
        code: data['code'] as dynamic,
        value: data['value'] as dynamic,
        amount: data['amount'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'has_discount': hasDiscount,
        'id': id,
        'code': code,
        'value': value,
        'amount': amount,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Discount].
  factory Discount.fromJson(String data) {
    return Discount.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Discount] to a JSON string.
  String toJson() => json.encode(toMap());

  Discount copyWith({
    bool? hasDiscount,
    dynamic id,
    dynamic code,
    dynamic value,
    String? amount,
  }) {
    return Discount(
      hasDiscount: hasDiscount ?? this.hasDiscount,
      id: id ?? this.id,
      code: code ?? this.code,
      value: value ?? this.value,
      amount: amount ?? this.amount,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [hasDiscount, id, code, value, amount];
}
