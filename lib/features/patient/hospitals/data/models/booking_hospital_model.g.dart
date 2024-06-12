// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_hospital_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllBookingHospitalsModel _$AllBookingHospitalsModelFromJson(
        Map<String, dynamic> json) =>
    AllBookingHospitalsModel(
      hospitals: (json['findHospitals'] as List<dynamic>?)
          ?.map((e) => BookingHospitalModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllBookingHospitalsModelToJson(
        AllBookingHospitalsModel instance) =>
    <String, dynamic>{
      'findHospitals': instance.hospitals,
    };

BookingHospitalModel _$BookingHospitalModelFromJson(
        Map<String, dynamic> json) =>
    BookingHospitalModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      role: json['role'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$BookingHospitalModelToJson(
        BookingHospitalModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'role': instance.role,
      'code': instance.code,
    };
