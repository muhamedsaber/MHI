// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_appointement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientAppointmentModel _$PatientAppointmentModelFromJson(
        Map<String, dynamic> json) =>
    PatientAppointmentModel(
      id: json['_id'] as String?,
      day: json['day'] as String?,
      time: json['time'] as String?,
      status: json['status'] as String?,
      doctorID: json['doctorID'] == null
          ? null
          : PatientAppointmentDoctorModel.fromJson(
              json['doctorID'] as Map<String, dynamic>),
      patientID: json['patientID'] == null
          ? null
          : PatientAppointmentPatientModel.fromJson(
              json['patientID'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PatientAppointmentModelToJson(
        PatientAppointmentModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'day': instance.day,
      'time': instance.time,
      'status': instance.status,
      'doctorID': instance.doctorID,
      'patientID': instance.patientID,
    };

PatientAppointmentDoctorModel _$PatientAppointmentDoctorModelFromJson(
        Map<String, dynamic> json) =>
    PatientAppointmentDoctorModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      specialize: json['specialize'] == null
          ? null
          : PatientAppointmentSpecializeModel.fromJson(
              json['specialize'] as Map<String, dynamic>),
      hospitalID: json['hospitalID'] == null
          ? null
          : PatientAppointmentHospitalModel.fromJson(
              json['hospitalID'] as Map<String, dynamic>),
      code: json['code'] as String?,
    );

Map<String, dynamic> _$PatientAppointmentDoctorModelToJson(
        PatientAppointmentDoctorModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'specialize': instance.specialize,
      'hospitalID': instance.hospitalID,
      'code': instance.code,
    };

PatientAppointmentSpecializeModel _$PatientAppointmentSpecializeModelFromJson(
        Map<String, dynamic> json) =>
    PatientAppointmentSpecializeModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PatientAppointmentSpecializeModelToJson(
        PatientAppointmentSpecializeModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };

PatientAppointmentHospitalModel _$PatientAppointmentHospitalModelFromJson(
        Map<String, dynamic> json) =>
    PatientAppointmentHospitalModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$PatientAppointmentHospitalModelToJson(
        PatientAppointmentHospitalModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'address': instance.address,
    };

PatientAppointmentPatientModel _$PatientAppointmentPatientModelFromJson(
        Map<String, dynamic> json) =>
    PatientAppointmentPatientModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      birthday: json['birthday'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$PatientAppointmentPatientModelToJson(
        PatientAppointmentPatientModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'birthday': instance.birthday,
      'code': instance.code,
    };
