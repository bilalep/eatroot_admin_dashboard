import 'dart:convert';

import 'package:equatable/equatable.dart';

class CustomNote extends Equatable {
  final dynamic en;
  final dynamic ar;

  const CustomNote({this.en, this.ar});

  factory CustomNote.fromMap(Map<String, dynamic> data) => CustomNote(
        en: data['en'] as dynamic,
        ar: data['ar'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'en': en,
        'ar': ar,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CustomNote].
  factory CustomNote.fromJson(String data) {
    return CustomNote.fromMap(json.decode(data) as Map<String, dynamic>);
  }

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

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [en, ar];
}
