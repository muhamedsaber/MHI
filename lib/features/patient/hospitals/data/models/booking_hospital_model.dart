

 
import 'package:json_annotation/json_annotation.dart';

part 'booking_hospital_model.g.dart';

@JsonSerializable()
class AllBookingHospitalsModel {
  @JsonKey(name: "findHospitals")
  final List<BookingHospitalModel>? hospitals;

  AllBookingHospitalsModel({this.hospitals});

  factory AllBookingHospitalsModel.fromJson(Map<String, dynamic> json) =>
      _$AllBookingHospitalsModelFromJson(json);
  Map<String, dynamic> toJson() => _$AllBookingHospitalsModelToJson(this);
}

@JsonSerializable()
class BookingHospitalModel {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? address;
  final String? role;
  final String? code;

  BookingHospitalModel(
      {this.id, this.name, this.address, this.role, this.code});

  factory BookingHospitalModel.fromJson(Map<String, dynamic> json) =>
      _$BookingHospitalModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookingHospitalModelToJson(this);
}
