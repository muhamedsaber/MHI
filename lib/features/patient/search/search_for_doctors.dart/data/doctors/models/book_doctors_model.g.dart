// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_doctors_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookDoctorsModel _$BookDoctorsModelFromJson(Map<String, dynamic> json) =>
    BookDoctorsModel(
      doctors: (json['doctors'] as List<dynamic>)
          .map((e) => BookModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookDoctorsModelToJson(BookDoctorsModel instance) =>
    <String, dynamic>{
      'doctors': instance.doctors,
    };

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
      doctorId: json['_id'] as String?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      code: json['code'] as String?,
      role: json['role'] as String?,
      specialize: json['specialize'] == null
          ? null
          : SpecializeBoodModel.fromJson(
              json['specialize'] as Map<String, dynamic>),
      hospitalId: json['hospitalID'] == null
          ? null
          : HospitalIdModel.fromJson(
              json['hospitalID'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      '_id': instance.doctorId,
      'name': instance.name,
      'username': instance.username,
      'code': instance.code,
      'role': instance.role,
      'specialize': instance.specialize,
      'hospitalID': instance.hospitalId,
    };

SpecializeBoodModel _$SpecializeBoodModelFromJson(Map<String, dynamic> json) =>
    SpecializeBoodModel(
      specializeId: json['_id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SpecializeBoodModelToJson(
        SpecializeBoodModel instance) =>
    <String, dynamic>{
      '_id': instance.specializeId,
      'name': instance.name,
    };

HospitalIdModel _$HospitalIdModelFromJson(Map<String, dynamic> json) =>
    HospitalIdModel(
      hospitalId: json['_id'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$HospitalIdModelToJson(HospitalIdModel instance) =>
    <String, dynamic>{
      '_id': instance.hospitalId,
      'name': instance.name,
      'address': instance.address,
    };
