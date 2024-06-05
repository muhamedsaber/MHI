// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseBody _$LoginResponseBodyFromJson(Map<String, dynamic> json) =>
    LoginResponseBody(
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
      hospitalDetails: json['hospitalDetails'] == null
          ? null
          : HospitalsDetails.fromJson(
              json['hospitalDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseBodyToJson(LoginResponseBody instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
      'hospitalDetails': instance.hospitalDetails,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: json['_id'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
      specialize: json['specialize'] as String?,
      hospitalId: json['hospitalID'] as String?,
      image: json['image'] as String?,
      role: json['role'] as String?,
      code: json['code'] as String?,
      birthday: json['birthday'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'password': instance.password,
      'name': instance.name,
      'specialize': instance.specialize,
      'hospitalID': instance.hospitalId,
      'image': instance.image,
      'role': instance.role,
      'code': instance.code,
      'birthday': instance.birthday,
    };

HospitalsDetails _$HospitalsDetailsFromJson(Map<String, dynamic> json) =>
    HospitalsDetails(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      role: json['role'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$HospitalsDetailsToJson(HospitalsDetails instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'role': instance.role,
      'code': instance.code,
    };
