import 'dart:convert';

import 'package:equatable/equatable.dart';

class Address extends Equatable {
  const Address({this.id, this.name, this.address});

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Address].
  factory Address.fromJson(String data) {
    return Address.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory Address.fromMap(Map<String, dynamic> data) => Address(
        id: data['id'] as int?,
        name: data['name'] as String?,
        address: data['address'] as String?,
      );

  final String? address;
  final int? id;
  final String? name;

  @override
  List<Object?> get props => [id, name, address];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'name': name,
        'address': address,
      };

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
}
