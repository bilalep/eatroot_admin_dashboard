import 'dart:convert';

import 'package:equatable/equatable.dart';

class StatusHistory extends Equatable {
  const StatusHistory({
    this.id,
    this.statusId,
    this.statusLabel,
    this.time,
  });

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [StatusHistory]
  factory StatusHistory.fromJson(String data) {
    return StatusHistory.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory StatusHistory.fromMap(Map<String, dynamic> data) => StatusHistory(
        id: data['id'] as int?,
        statusId: data['status_id'] as int?,
        statusLabel: data['status_label'] as String?,
        time: data['time'] as String?,
      );

  final int? id;
  final int? statusId;
  final String? statusLabel;
  final String? time;

  @override
  List<Object?> get props => [id, statusId, statusLabel, time];

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'status_id': statusId,
        'status_label': statusLabel,
        'time': time,
      };

  /// `dart:convert`
  ///
  /// Converts [StatusHistory] to a JSON string.
  String toJson() => json.encode(toMap());

  StatusHistory copyWith({
    int? id,
    int? statusId,
    String? statusLabel,
    String? time,
  }) {
    return StatusHistory(
      id: id ?? this.id,
      statusId: statusId ?? this.statusId,
      statusLabel: statusLabel ?? this.statusLabel,
      time: time ?? this.time,
    );
  }
}
