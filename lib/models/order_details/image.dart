import 'dart:convert';

import 'package:equatable/equatable.dart';

class Image extends Equatable {
  const Image({this.thumb, this.thumbBlur, this.large, this.largeBlur});

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Image].
  factory Image.fromJson(String data) {
    return Image.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory Image.fromMap(Map<String, dynamic> data) => Image(
        thumb: data['thumb'] as String?,
        thumbBlur: data['thumb_blur'] as String?,
        large: data['large'] as String?,
        largeBlur: data['large_blur'] as String?,
      );

  final String? large;
  final String? largeBlur;
  final String? thumb;
  final String? thumbBlur;

  @override
  List<Object?> get props => [thumb, thumbBlur, large, largeBlur];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'thumb': thumb,
        'thumb_blur': thumbBlur,
        'large': large,
        'large_blur': largeBlur,
      };

  /// `dart:convert`
  ///
  /// Converts [Image] to a JSON string.
  String toJson() => json.encode(toMap());

  Image copyWith({
    String? thumb,
    String? thumbBlur,
    String? large,
    String? largeBlur,
  }) {
    return Image(
      thumb: thumb ?? this.thumb,
      thumbBlur: thumbBlur ?? this.thumbBlur,
      large: large ?? this.large,
      largeBlur: largeBlur ?? this.largeBlur,
    );
  }
}
