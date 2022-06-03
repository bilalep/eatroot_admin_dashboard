import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tech_test/models/order_details/attribute.dart';

class Item extends Equatable {
  final int? id;
  final int? menuId;
  final String? menuName;
  final int? quantity;
  final String? unitPrice;
  final String? unitSalesPrice;
  final String? subTotal;
  final String? total;
  final bool? cancelled;
  final dynamic note;
  final List<Attribute?>? attributes;

  const Item({
    this.id,
    this.menuId,
    this.menuName,
    this.quantity,
    this.unitPrice,
    this.unitSalesPrice,
    this.subTotal,
    this.total,
    this.cancelled,
    this.note,
    this.attributes,
  });

  factory Item.fromMap(Map<String, dynamic> data) => Item(
        id: data['id'] as int?,
        menuId: data['menu_id'] as int?,
        menuName: data['menu_name'] as String?,
        quantity: data['quantity'] as int?,
        unitPrice: data['unit_price'] as String?,
        unitSalesPrice: data['unit_sales_price'] as String?,
        subTotal: data['sub_total'] as String?,
        total: data['total'] as String?,
        cancelled: data['cancelled'] as bool?,
        note: data['note'] as dynamic,
        attributes: (data['attributes'] as List<dynamic>?)
            ?.map((e) => Attribute.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'menu_id': menuId,
        'menu_name': menuName,
        'quantity': quantity,
        'unit_price': unitPrice,
        'unit_sales_price': unitSalesPrice,
        'sub_total': subTotal,
        'total': total,
        'cancelled': cancelled,
        'note': note,
        'attributes': attributes,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Item].
  factory Item.fromJson(String data) {
    return Item.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Item] to a JSON string.
  String toJson() => json.encode(toMap());

  Item copyWith({
    int? id,
    int? menuId,
    String? menuName,
    int? quantity,
    String? unitPrice,
    String? unitSalesPrice,
    String? subTotal,
    String? total,
    bool? cancelled,
    dynamic note,
    List<Attribute?>? attributes,
  }) {
    return Item(
      id: id ?? this.id,
      menuId: menuId ?? this.menuId,
      menuName: menuName ?? this.menuName,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      unitSalesPrice: unitSalesPrice ?? this.unitSalesPrice,
      subTotal: subTotal ?? this.subTotal,
      total: total ?? this.total,
      cancelled: cancelled ?? this.cancelled,
      note: note ?? this.note,
      attributes: attributes ?? this.attributes,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      menuId,
      menuName,
      quantity,
      unitPrice,
      unitSalesPrice,
      subTotal,
      total,
      cancelled,
      note,
      attributes,
    ];
  }
}
