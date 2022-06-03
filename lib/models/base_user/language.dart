import 'dart:convert';

import 'package:equatable/equatable.dart';

class Language extends Equatable {
  final int? id;
  final int? relId;
  final String? label;
  final String? lang;
  final bool? active;

  const Language({this.id, this.relId, this.label, this.lang, this.active});

  factory Language.fromMap(Map<String, dynamic> data) => Language(
        id: data['id'] as int?,
        relId: data['rel_id'] as int?,
        label: data['label'] as String?,
        lang: data['lang'] as String?,
        active: data['active'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'rel_id': relId,
        'label': label,
        'lang': lang,
        'active': active,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Language].
  factory Language.fromJson(String data) {
    return Language.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Language] to a JSON string.
  String toJson() => json.encode(toMap());

  Language copyWith({
    int? id,
    int? relId,
    String? label,
    String? lang,
    bool? active,
  }) {
    return Language(
      id: id ?? this.id,
      relId: relId ?? this.relId,
      label: label ?? this.label,
      lang: lang ?? this.lang,
      active: active ?? this.active,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, relId, label, lang, active];
}
