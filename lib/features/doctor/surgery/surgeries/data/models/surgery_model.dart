import 'package:json_annotation/json_annotation.dart';
part 'surgery_model.g.dart';
@JsonSerializable()
class SurgeryModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? day;
  final String? time;
   @JsonKey(name: "doctorID")
  final DoctorSurgeryModel? doctor;
  @JsonKey(name: "patientID")
  final PatientSurgeryModel? patient;

  SurgeryModel({
    this.id,
    this.day,
    this.time,
    this.doctor,
    this.patient,
  });

  factory SurgeryModel.fromJson(Map<String, dynamic> json) =>
      _$SurgeryModelFromJson(json);
  Map<String, dynamic> toJson() => _$SurgeryModelToJson(this);
}

@JsonSerializable()
class DoctorSurgeryModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? specialize;
  final String? hospitalID;

  DoctorSurgeryModel({
    this.id,
    this.name,
    this.specialize,
    this.hospitalID,
  });

  factory DoctorSurgeryModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorSurgeryModelFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorSurgeryModelToJson(this);
}

@JsonSerializable()
class PatientSurgeryModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? username;
  final String? name;
  final String? birthday;

  PatientSurgeryModel({
    this.id,
    this.username,
    this.name,
    this.birthday,
  });

  factory PatientSurgeryModel.fromJson(Map<String, dynamic> json) =>
      _$PatientSurgeryModelFromJson(json);
  Map<String, dynamic> toJson() => _$PatientSurgeryModelToJson(this);
}
