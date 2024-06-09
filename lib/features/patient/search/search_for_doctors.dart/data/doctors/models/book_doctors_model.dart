// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_doctors_model.g.dart';

@JsonSerializable()
class BookDoctorsModel {
  final List<BookModel> doctors;

  BookDoctorsModel({required this.doctors});

  factory BookDoctorsModel.fromJson(Map<String, dynamic> json) =>
      _$BookDoctorsModelFromJson(_normalizeJson(json));

  Map<String, dynamic> toJson() => _$BookDoctorsModelToJson(this);

  static Map<String, dynamic> _normalizeJson(Map<String, dynamic> json) {
    if (json.containsKey('userD')) {
      return {"doctors": json['userD']};
    } else if (json.containsKey('search')) {
      return {"doctors": json['search']};
    }
    return json;
  }
}

@JsonSerializable()
class BookModel {
  @JsonKey(name: "_id")
  final String? doctorId;
  final String? name;
  final String? username;
  final String? code;
  final String? role;
  final SpecializeBoodModel? specialize;
  @JsonKey(name: "hospitalID")
  final HospitalIdModel? hospitalId;

  BookModel({
    this.doctorId,
    this.name,
    this.username,
    this.code,
    this.role,
    this.specialize,
    this.hospitalId,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookModelToJson(this);
}

@JsonSerializable()
class SpecializeBoodModel {
  @JsonKey(name: "_id")
  final String? specializeId;
  final String? name;

  SpecializeBoodModel({this.specializeId, this.name});

  factory SpecializeBoodModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializeBoodModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpecializeBoodModelToJson(this);
}

@JsonSerializable()
class HospitalIdModel {
  @JsonKey(name: "_id")
  final String? hospitalId;
  final String? name;
  final String? address;

  HospitalIdModel({this.hospitalId, this.name, this.address});

  factory HospitalIdModel.fromJson(Map<String, dynamic> json) =>
      _$HospitalIdModelFromJson(json);

  Map<String, dynamic> toJson() => _$HospitalIdModelToJson(this);
}
