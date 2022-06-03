import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:tech_test/models/base_user/user.dart';

class BaseUser extends Equatable {
  const BaseUser({this.user, this.token});

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BaseUser].
  factory BaseUser.fromJson(String data) {
    return BaseUser.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory BaseUser.fromMap(Map<String, dynamic> data) => BaseUser(
        user: data['user'] == null
            ? null
            : User.fromMap(data['user'] as Map<String, dynamic>),
        token: data['token'] as String?,
      );

  final String? token;
  final User? user;

  @override
  List<Object?> get props => [user, token];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'user': user?.toMap(),
        'token': token,
      };

  /// `dart:convert`
  ///
  /// Converts [BaseUser] to a JSON string.
  String toJson() => json.encode(toMap());

  BaseUser copyWith({
    User? user,
    String? token,
  }) {
    return BaseUser(
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }
}
