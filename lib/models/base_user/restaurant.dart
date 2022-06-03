import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'custom_note.dart';
import 'language.dart';
import 'settings.dart';

class Restaurant extends Equatable {
  final int? id;
  final String? nameEn;
  final String? nameAr;
  final String? slug;
  final String? email;
  final String? mobile;
  final String? phone1;
  final String? phone2;
  final String? address;
  final dynamic logo;
  final int? hasDelivery;
  final bool? testMode;
  final int? hasPickup;
  final String? deliveryFee;
  final String? pickupFee;
  final int? numberOfOutlets;
  final String? status;
  final CustomNote? customNote;
  final List<Language>? languages;
  final Settings? settings;

  const Restaurant({
    this.id,
    this.nameEn,
    this.nameAr,
    this.slug,
    this.email,
    this.mobile,
    this.phone1,
    this.phone2,
    this.address,
    this.logo,
    this.hasDelivery,
    this.testMode,
    this.hasPickup,
    this.deliveryFee,
    this.pickupFee,
    this.numberOfOutlets,
    this.status,
    this.customNote,
    this.languages,
    this.settings,
  });

  factory Restaurant.fromMap(Map<String, dynamic> data) => Restaurant(
        id: data['id'] as int?,
        nameEn: data['name_en'] as String?,
        nameAr: data['name_ar'] as String?,
        slug: data['slug'] as String?,
        email: data['email'] as String?,
        mobile: data['mobile'] as String?,
        phone1: data['phone_1'] as String?,
        phone2: data['phone_2'] as String?,
        address: data['address'] as String?,
        logo: data['logo'] as dynamic,
        hasDelivery: data['has_delivery'] as int?,
        testMode: data['test_mode'] as bool?,
        hasPickup: data['has_pickup'] as int?,
        deliveryFee: data['delivery_fee'] as String?,
        pickupFee: data['pickup_fee'] as String?,
        numberOfOutlets: data['number_of_outlets'] as int?,
        status: data['status'] as String?,
        customNote: data['custom_note'] == null
            ? null
            : CustomNote.fromMap(data['custom_note'] as Map<String, dynamic>),
        languages: (data['languages'] as List<dynamic>?)
            ?.map((e) => Language.fromMap(e as Map<String, dynamic>))
            .toList(),
        settings: data['settings'] == null
            ? null
            : Settings.fromMap(data['settings'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name_en': nameEn,
        'name_ar': nameAr,
        'slug': slug,
        'email': email,
        'mobile': mobile,
        'phone_1': phone1,
        'phone_2': phone2,
        'address': address,
        'logo': logo,
        'has_delivery': hasDelivery,
        'test_mode': testMode,
        'has_pickup': hasPickup,
        'delivery_fee': deliveryFee,
        'pickup_fee': pickupFee,
        'number_of_outlets': numberOfOutlets,
        'status': status,
        'custom_note': customNote?.toMap(),
        'languages': languages?.map((e) => e.toMap()).toList(),
        'settings': settings?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Restaurant].
  factory Restaurant.fromJson(String data) {
    return Restaurant.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Restaurant] to a JSON string.
  String toJson() => json.encode(toMap());

  Restaurant copyWith({
    int? id,
    String? nameEn,
    String? nameAr,
    String? slug,
    String? email,
    String? mobile,
    String? phone1,
    String? phone2,
    String? address,
    dynamic logo,
    int? hasDelivery,
    bool? testMode,
    int? hasPickup,
    String? deliveryFee,
    String? pickupFee,
    int? numberOfOutlets,
    String? status,
    CustomNote? customNote,
    List<Language>? languages,
    Settings? settings,
  }) {
    return Restaurant(
      id: id ?? this.id,
      nameEn: nameEn ?? this.nameEn,
      nameAr: nameAr ?? this.nameAr,
      slug: slug ?? this.slug,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      phone1: phone1 ?? this.phone1,
      phone2: phone2 ?? this.phone2,
      address: address ?? this.address,
      logo: logo ?? this.logo,
      hasDelivery: hasDelivery ?? this.hasDelivery,
      testMode: testMode ?? this.testMode,
      hasPickup: hasPickup ?? this.hasPickup,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      pickupFee: pickupFee ?? this.pickupFee,
      numberOfOutlets: numberOfOutlets ?? this.numberOfOutlets,
      status: status ?? this.status,
      customNote: customNote ?? this.customNote,
      languages: languages ?? this.languages,
      settings: settings ?? this.settings,
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
      slug,
      email,
      mobile,
      phone1,
      phone2,
      address,
      logo,
      hasDelivery,
      testMode,
      hasPickup,
      deliveryFee,
      pickupFee,
      numberOfOutlets,
      status,
      customNote,
      languages,
      settings,
    ];
  }
}
