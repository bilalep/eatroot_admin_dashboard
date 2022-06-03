import 'dart:convert';

import 'package:equatable/equatable.dart';

class Attribute extends Equatable {
  final int? id;
  final int? attributeId;
  final String? attribute;
  final String? actualPrice;
  final String? salesPrice;
  final String? total;

  const Attribute({
    this.id,
    this.attributeId,
    this.attribute,
    this.actualPrice,
    this.salesPrice,
    this.total,
  });

  factory Attribute.fromMap(Map<String, dynamic> data) => Attribute(
        id: data['id'] as int?,
        attributeId: data['attribute_id'] as int?,
        attribute: data['attribute'] as String?,
        actualPrice: data['actual_price'] as String?,
        salesPrice: data['sales_price'] as String?,
        total: data['total'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'attribute_id': attributeId,
        'attribute': attribute,
        'actual_price': actualPrice,
        'sales_price': salesPrice,
        'total': total,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Attribute].
  factory Attribute.fromJson(String data) {
    return Attribute.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Attribute] to a JSON string.
  String toJson() => json.encode(toMap());

  Attribute copyWith({
    int? id,
    int? attributeId,
    String? attribute,
    String? actualPrice,
    String? salesPrice,
    String? total,
  }) {
    return Attribute(
      id: id ?? this.id,
      attributeId: attributeId ?? this.attributeId,
      attribute: attribute ?? this.attribute,
      actualPrice: actualPrice ?? this.actualPrice,
      salesPrice: salesPrice ?? this.salesPrice,
      total: total ?? this.total,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      attributeId,
      attribute,
      actualPrice,
      salesPrice,
      total,
    ];
  }
}
