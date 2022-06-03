import 'dart:convert';

import 'package:equatable/equatable.dart';

class CustomNote extends Equatable {
  const CustomNote({this.en, this.ar});

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CustomNote].
  factory CustomNote.fromJson(String data) {
    return CustomNote.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory CustomNote.fromMap(Map<String, dynamic> data) => CustomNote(
        en: data['en'] as dynamic,
        ar: data['ar'] as dynamic,
      );

  final dynamic ar;
  final dynamic en;

  @override
  List<Object?> get props => [en, ar];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'en': en,
        'ar': ar,
      };

  /// `dart:convert`
  ///
  /// Converts [CustomNote] to a JSON string.
  String toJson() => json.encode(toMap());

  CustomNote copyWith({
    dynamic en,
    dynamic ar,
  }) {
    return CustomNote(
      en: en ?? this.en,
      ar: ar ?? this.ar,
    );
  }
}
