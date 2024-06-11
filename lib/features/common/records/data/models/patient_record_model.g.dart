// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientRecordModel _$PatientRecordModelFromJson(Map<String, dynamic> json) =>
    PatientRecordModel(
      id: json['_id'] as String?,
      medicine: json['medicine'] as String?,
      diagnose: json['diagnose'] as String?,
      date: json['date'] as String?,
      doctor: json['doctor'] == null
          ? null
          : PatientRecordDoctorData.fromJson(
              json['doctor'] as Map<String, dynamic>),
      patient: json['patient'] == null
          ? null
          : PatientDataRecord.fromJson(json['patient'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PatientRecordModelToJson(PatientRecordModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'medicine': instance.medicine,
      'diagnose': instance.diagnose,
      'date': instance.date,
      'doctor': instance.doctor,
      'patient': instance.patient,
    };

PatientRecordDoctorData _$PatientRecordDoctorDataFromJson(
        Map<String, dynamic> json) =>
    PatientRecordDoctorData(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      specialize: json['specialize'] == null
          ? null
          : PatientRecordSpecializeData.fromJson(
              json['specialize'] as Map<String, dynamic>),
      hospitalID: json['hospitalID'] == null
          ? null
          : HospitalData.fromJson(json['hospitalID'] as Map<String, dynamic>),
      code: json['code'] as String?,
    );

Map<String, dynamic> _$PatientRecordDoctorDataToJson(
        PatientRecordDoctorData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'specialize': instance.specialize,
      'hospitalID': instance.hospitalID,
      'code': instance.code,
    };

PatientRecordSpecializeData _$PatientRecordSpecializeDataFromJson(
        Map<String, dynamic> json) =>
    PatientRecordSpecializeData(
      id: json['_id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PatientRecordSpecializeDataToJson(
        PatientRecordSpecializeData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };

HospitalData _$HospitalDataFromJson(Map<String, dynamic> json) => HospitalData(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$HospitalDataToJson(HospitalData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'address': instance.address,
    };

PatientDataRecord _$PatientDataRecordFromJson(Map<String, dynamic> json) =>
    PatientDataRecord(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      birthday: json['birthday'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$PatientDataRecordToJson(PatientDataRecord instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'birthday': instance.birthday,
      'code': instance.code,
    };
