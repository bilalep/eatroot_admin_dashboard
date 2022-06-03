import 'dart:convert';

import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  const Customer({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.regUser,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Customer].
  factory Customer.fromJson(String data) {
    return Customer.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory Customer.fromMap(Map<String, dynamic> data) => Customer(
        id: data['id'] as int?,
        name: data['name'] as String?,
        email: data['email'] as String?,
        mobile: data['mobile'] as String?,
        regUser: data['reg_user'] as bool?,
      );

  final String? email;
  final int? id;
  final String? mobile;
  final String? name;
  final bool? regUser;

  @override
  List<Object?> get props => [id, name, email, mobile, regUser];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'name': name,
        'email': email,
        'mobile': mobile,
        'reg_user': regUser,
      };

  /// `dart:convert`
  ///
  /// Converts [Customer] to a JSON string.
  String toJson() => json.encode(toMap());

  Customer copyWith({
    int? id,
    String? name,
    String? email,
    String? mobile,
    bool? regUser,
  }) {
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      regUser: regUser ?? this.regUser,
    );
  }
}
