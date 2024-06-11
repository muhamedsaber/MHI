import 'package:freezed_annotation/freezed_annotation.dart';
part 'patient_record_model.g.dart';

@JsonSerializable()
class PatientRecordModel {
  @JsonKey(name: "_id")
  final String? id;
  final String? medicine;
  final String? diagnose;
  final String? date;
  final PatientRecordDoctorData? doctor;
  final PatientDataRecord? patient;

  PatientRecordModel({
    this.id,
    this.medicine,
    this.diagnose,
    this.date,
    this.doctor,
    this.patient,
  });

  factory PatientRecordModel.fromJson(Map<String, dynamic> json) =>
      _$PatientRecordModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientRecordModelToJson(this);
}

@JsonSerializable()
class PatientRecordDoctorData {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final PatientRecordSpecializeData? specialize;
  final HospitalData? hospitalID;
  final String? code;

  PatientRecordDoctorData({
    this.id,
    this.name,
    this.specialize,
    this.hospitalID,
    this.code,
  });

  factory PatientRecordDoctorData.fromJson(Map<String, dynamic> json) =>
      _$PatientRecordDoctorDataFromJson(json);

  Map<String, dynamic> toJson() => _$PatientRecordDoctorDataToJson(this);
}

@JsonSerializable()
class PatientRecordSpecializeData {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;

  PatientRecordSpecializeData({
    this.id,
    this.name,
  });

  factory PatientRecordSpecializeData.fromJson(Map<String, dynamic> json) =>
      _$PatientRecordSpecializeDataFromJson(json);

  Map<String, dynamic> toJson() => _$PatientRecordSpecializeDataToJson(this);
}

@JsonSerializable()
class HospitalData {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? address;

  HospitalData({
    this.id,
    this.name,
    this.address,
  });

  factory HospitalData.fromJson(Map<String, dynamic> json) =>
      _$HospitalDataFromJson(json);

  Map<String, dynamic> toJson() => _$HospitalDataToJson(this);
}

@JsonSerializable()
class PatientDataRecord {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? birthday;
  final String? code;

  PatientDataRecord({
    this.id,
    this.name,
    this.birthday,
    this.code,
  });

  factory PatientDataRecord.fromJson(Map<String, dynamic> json) =>
      _$PatientDataRecordFromJson(json);

  Map<String, dynamic> toJson() => _$PatientDataRecordToJson(this);
}