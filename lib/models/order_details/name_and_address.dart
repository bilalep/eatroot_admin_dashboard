import 'dart:convert';

import 'package:equatable/equatable.dart';

class NameAndAddress extends Equatable {
  const NameAndAddress({this.ar, this.en});

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [NameAndAddress].
  factory NameAndAddress.fromJson(String data) {
    return NameAndAddress.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  // factory NameAndAddress.fromMap(Map<String, dynamic> data) {
  //   return NameAndAddress(
  //       ar: data['ar'] as String?,
  //       en: data['en'] as String?,
  //     );
  // }

  factory NameAndAddress.fromMap(dynamic data) {
    try {
      data = data as Map<String, dynamic>;
      return NameAndAddress(
        ar: data['ar'] as String?,
        en: data['en'] as String?,
      );
    } catch (e) {
      print('NameAddress.fromMap exception: $e');
      return NameAndAddress(
        ar: data as String?,
        en: data,
      );
    }
  }

  final String? ar;
  final String? en;

  @override
  List<Object?> get props => [ar, en];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'ar': ar,
        'en': en,
      };

  /// `dart:convert`
  ///
  /// Converts [NameAndAddress] to a JSON string.
  String toJson() => json.encode(toMap());

  NameAndAddress copyWith({
    String? ar,
    String? en,
  }) {
    return NameAndAddress(
      ar: ar ?? this.ar,
      en: en ?? this.en,
    );
  }
}
