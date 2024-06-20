// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_appointement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorAppointements _$DoctorAppointementsFromJson(Map<String, dynamic> json) =>
    DoctorAppointements(
      appointements: (json['getbook'] as List<dynamic>)
          .map((e) =>
              DoctorAppointementModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DoctorAppointementsToJson(
        DoctorAppointements instance) =>
    <String, dynamic>{
      'getbook': instance.appointements,
    };

DoctorAppointementModel _$DoctorAppointementModelFromJson(
        Map<String, dynamic> json) =>
    DoctorAppointementModel(
      id: json['_id'] as String?,
      day: json['day'] as String?,
      time: json['time'] as String?,
      status: json['status'] as String?,
      doctorID: json['doctorID'] as String?,
      patientId: json['patientID'] == null
          ? null
          : DoctorAppointmentPatientModel.fromJson(
              json['patientID'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DoctorAppointementModelToJson(
        DoctorAppointementModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'day': instance.day,
      'time': instance.time,
      'status': instance.status,
      'doctorID': instance.doctorID,
      'patientID': instance.patientId,
    };

DoctorAppointmentPatientModel _$DoctorAppointmentPatientModelFromJson(
        Map<String, dynamic> json) =>
    DoctorAppointmentPatientModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      birthday: json['birthday'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$DoctorAppointmentPatientModelToJson(
        DoctorAppointmentPatientModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'birthday': instance.birthday,
      'code': instance.code,
    };
