import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:tech_test/models/base_user/outlet.dart';
import 'package:tech_test/models/base_user/restaurant.dart';

class User extends Equatable {
  const User({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.role,
    this.status,
    this.hasMultiRestaurants,
    this.restaurant,
    this.outlets,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory User.fromMap(Map<String, dynamic> data) => User(
        id: data['id'] as int?,
        name: data['name'] as String?,
        email: data['email'] as String?,
        mobile: data['mobile'] as String?,
        role: data['role'] as String?,
        status: data['status'] as String?,
        hasMultiRestaurants: data['has_multi_restaurants'] as bool?,
        restaurant: data['restaurant'] == null
            ? null
            : Restaurant.fromMap(data['restaurant'] as Map<String, dynamic>),
        outlets: (data['outlets'] as List<dynamic>?)
            ?.map((dynamic e) => Outlet.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  final String? email;
  final bool? hasMultiRestaurants;
  final int? id;
  final String? mobile;
  final String? name;
  final List<Outlet>? outlets;
  final Restaurant? restaurant;
  final String? role;
  final String? status;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      mobile,
      role,
      status,
      hasMultiRestaurants,
      restaurant,
      outlets,
    ];
  }

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'name': name,
        'email': email,
        'mobile': mobile,
        'role': role,
        'status': status,
        'has_multi_restaurants': hasMultiRestaurants,
        'restaurant': restaurant?.toMap(),
        'outlets': outlets?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? mobile,
    String? role,
    String? status,
    bool? hasMultiRestaurants,
    Restaurant? restaurant,
    List<Outlet>? outlets,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      role: role ?? this.role,
      status: status ?? this.status,
      hasMultiRestaurants: hasMultiRestaurants ?? this.hasMultiRestaurants,
      restaurant: restaurant ?? this.restaurant,
      outlets: outlets ?? this.outlets,
    );
  }
}
