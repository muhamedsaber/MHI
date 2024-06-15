

import 'package:json_annotation/json_annotation.dart';

part 'patient_appointement_model.g.dart';

@JsonSerializable()
class PatientAppointmentModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? day;
  final String? time;
  final String? status;
  final PatientAppointmentDoctorModel? doctorID;
  final PatientAppointmentPatientModel? patientID;

  PatientAppointmentModel({
    this.id,
    this.day,
    this.time,
    this.status,
    this.doctorID,
    this.patientID,
  });

  factory PatientAppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$PatientAppointmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientAppointmentModelToJson(this);
}

@JsonSerializable()
class PatientAppointmentDoctorModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final PatientAppointmentSpecializeModel? specialize;
  final PatientAppointmentHospitalModel? hospitalID;
  final String? code;

  PatientAppointmentDoctorModel({
    this.id,
    this.name,
    this.specialize,
    this.hospitalID,
    this.code,
  });

  factory PatientAppointmentDoctorModel.fromJson(Map<String, dynamic> json) =>
      _$PatientAppointmentDoctorModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientAppointmentDoctorModelToJson(this);
}

@JsonSerializable()
class PatientAppointmentSpecializeModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;

  PatientAppointmentSpecializeModel({
    this.id,
    this.name,
  });

  factory PatientAppointmentSpecializeModel.fromJson(Map<String, dynamic> json) =>
      _$PatientAppointmentSpecializeModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientAppointmentSpecializeModelToJson(this);
}

@JsonSerializable()
class PatientAppointmentHospitalModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? address;

  PatientAppointmentHospitalModel({
    this.id,
    this.name,
    this.address,
  });

  factory PatientAppointmentHospitalModel.fromJson(Map<String, dynamic> json) =>
      _$PatientAppointmentHospitalModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientAppointmentHospitalModelToJson(this);
}

@JsonSerializable()
class PatientAppointmentPatientModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? birthday;
  final String? code;

  PatientAppointmentPatientModel({
    this.id,
    this.name,
    this.birthday,
    this.code,
  });

  factory PatientAppointmentPatientModel.fromJson(Map<String, dynamic> json) =>
      _$PatientAppointmentPatientModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientAppointmentPatientModelToJson(this);
}