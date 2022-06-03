import 'dart:convert';

import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final int? id;
  final String? name;
  final String? address;

  const Address({this.id, this.name, this.address});

  factory Address.fromMap(Map<String, dynamic> data) => Address(
        id: data['id'] as int?,
        name: data['name'] as String?,
        address: data['address'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'address': address,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Address].
  factory Address.fromJson(String data) {
    return Address.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Address] to a JSON string.
  String toJson() => json.encode(toMap());

  Address copyWith({
    int? id,
    String? name,
    String? address,
  }) {
    return Address(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, address];
}
