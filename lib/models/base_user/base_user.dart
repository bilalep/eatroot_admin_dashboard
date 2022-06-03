import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'user.dart';

class BaseUser extends Equatable {
  final User? user;
  final String? token;

  const BaseUser({this.user, this.token});

  factory BaseUser.fromMap(Map<String, dynamic> data) => BaseUser(
        user: data['user'] == null
            ? null
            : User.fromMap(data['user'] as Map<String, dynamic>),
        token: data['token'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'user': user?.toMap(),
        'token': token,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BaseUser].
  factory BaseUser.fromJson(String data) {
    return BaseUser.fromMap(json.decode(data) as Map<String, dynamic>);
  }

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

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [user, token];
}
