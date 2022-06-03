import 'dart:convert';

import 'package:equatable/equatable.dart';

class Outlet extends Equatable {
  final int? id;
  final String? nameEn;
  final String? nameAr;
  final String? addressEn;
  final String? addressAr;
  final dynamic image;
  final String? status;
  final bool? deliveryPaused;
  final bool? pickupPaused;
  final List<dynamic>? deliveryPartners;

  const Outlet({
    this.id,
    this.nameEn,
    this.nameAr,
    this.addressEn,
    this.addressAr,
    this.image,
    this.status,
    this.deliveryPaused,
    this.pickupPaused,
    this.deliveryPartners,
  });

  factory Outlet.fromMap(Map<String, dynamic> data) => Outlet(
        id: data['id'] as int?,
        nameEn: data['name_en'] as String?,
        nameAr: data['name_ar'] as String?,
        addressEn: data['address_en'] as String?,
        addressAr: data['address_ar'] as String?,
        image: data['image'] as dynamic,
        status: data['status'] as String?,
        deliveryPaused: data['delivery_paused'] as bool?,
        pickupPaused: data['pickup_paused'] as bool?,
        deliveryPartners: data['delivery_partners'] as List<dynamic>?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name_en': nameEn,
        'name_ar': nameAr,
        'address_en': addressEn,
        'address_ar': addressAr,
        'image': image,
        'status': status,
        'delivery_paused': deliveryPaused,
        'pickup_paused': pickupPaused,
        'delivery_partners': deliveryPartners,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Outlet].
  factory Outlet.fromJson(String data) {
    return Outlet.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Outlet] to a JSON string.
  String toJson() => json.encode(toMap());

  Outlet copyWith({
    int? id,
    String? nameEn,
    String? nameAr,
    String? addressEn,
    String? addressAr,
    dynamic image,
    String? status,
    bool? deliveryPaused,
    bool? pickupPaused,
    List<dynamic>? deliveryPartners,
  }) {
    return Outlet(
      id: id ?? this.id,
      nameEn: nameEn ?? this.nameEn,
      nameAr: nameAr ?? this.nameAr,
      addressEn: addressEn ?? this.addressEn,
      addressAr: addressAr ?? this.addressAr,
      image: image ?? this.image,
      status: status ?? this.status,
      deliveryPaused: deliveryPaused ?? this.deliveryPaused,
      pickupPaused: pickupPaused ?? this.pickupPaused,
      deliveryPartners: deliveryPartners ?? this.deliveryPartners,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      nameEn,
      nameAr,
      addressEn,
      addressAr,
      image,
      status,
      deliveryPaused,
      pickupPaused,
      deliveryPartners,
    ];
  }
}
