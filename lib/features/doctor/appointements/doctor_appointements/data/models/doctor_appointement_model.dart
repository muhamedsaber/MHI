import 'package:json_annotation/json_annotation.dart';
part 'doctor_appointement_model.g.dart';

@JsonSerializable()
class DoctorAppointements {
  @JsonKey(name: 'getbook')
  final List<DoctorAppointementModel> appointements;

  DoctorAppointements({required this.appointements});

  factory DoctorAppointements.fromJson(Map<String, dynamic> json) =>
      _$DoctorAppointementsFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorAppointementsToJson(this);
}

@JsonSerializable()
class DoctorAppointementModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? day;
  final String? time;
  final String? status;
  final String? doctorID;
  @JsonKey(name: "patientID")
  final DoctorAppointmentPatientModel? patientId;

  DoctorAppointementModel(
      {this.id,
      this.day,
      this.time,
      this.status,
      this.doctorID,
      this.patientId});

  factory DoctorAppointementModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorAppointementModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorAppointementModelToJson(this);
}

@JsonSerializable()
class DoctorAppointmentPatientModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? birthday;
  final String? code;

  DoctorAppointmentPatientModel({
    this.id,
    this.name,
    this.birthday,
    this.code,
  });

  factory DoctorAppointmentPatientModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorAppointmentPatientModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorAppointmentPatientModelToJson(this);
}
