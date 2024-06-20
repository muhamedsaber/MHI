// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surgery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurgeryModel _$SurgeryModelFromJson(Map<String, dynamic> json) => SurgeryModel(
      id: json['_id'] as String?,
      day: json['day'] as String?,
      time: json['time'] as String?,
      doctor: json['doctorID'] == null
          ? null
          : DoctorSurgeryModel.fromJson(
              json['doctorID'] as Map<String, dynamic>),
      patient: json['patientID'] == null
          ? null
          : PatientSurgeryModel.fromJson(
              json['patientID'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SurgeryModelToJson(SurgeryModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'day': instance.day,
      'time': instance.time,
      'doctorID': instance.doctor,
      'patientID': instance.patient,
    };

DoctorSurgeryModel _$DoctorSurgeryModelFromJson(Map<String, dynamic> json) =>
    DoctorSurgeryModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      specialize: json['specialize'] as String?,
      hospitalID: json['hospitalID'] as String?,
    );

Map<String, dynamic> _$DoctorSurgeryModelToJson(DoctorSurgeryModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'specialize': instance.specialize,
      'hospitalID': instance.hospitalID,
    };

PatientSurgeryModel _$PatientSurgeryModelFromJson(Map<String, dynamic> json) =>
    PatientSurgeryModel(
      id: json['_id'] as String?,
      username: json['username'] as String?,
      name: json['name'] as String?,
      birthday: json['birthday'] as String?,
    );

Map<String, dynamic> _$PatientSurgeryModelToJson(
        PatientSurgeryModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'birthday': instance.birthday,
    };
