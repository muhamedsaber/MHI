import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_response_body.g.dart';

@JsonSerializable()
class LoginResponseBody {
  final String? token;
  final UserData? user;
  final HospitalsDetails? hospitalDetails;
  LoginResponseBody({this.token, this.user, this.hospitalDetails});
  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseBodyToJson(this);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: "_id")
  final String? id;
  final String? username;
  final String? password;
  final String? name;
  final String? specialize;
  @JsonKey(name: "hospitalID")
  final String? hospitalId;
  final String? image;
  final String? role;
  final String? code;
  final String? birthday;

  UserData(
      {this.id,
      this.username,
      this.password,
      this.name,
      this.specialize,
      this.hospitalId,
      this.image,
      this.role,
      this.code,
      this.birthday});
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable()
class HospitalsDetails {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? address;
  final String? role;
  final String? code;
  HospitalsDetails({this.id, this.name, this.address, this.role, this.code});
  factory HospitalsDetails.fromJson(Map<String, dynamic> json) =>
      _$HospitalsDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$HospitalsDetailsToJson(this);
}
