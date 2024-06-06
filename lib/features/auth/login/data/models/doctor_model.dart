import 'package:mhi/features/auth/login/data/domain/user_entity.dart';

class DoctorModel extends UserEntity {
  DoctorModel({
    required super.token,
    required super.username,
    required super.id,
    required super.password,
    required super.name,
    required super.specialize,
    required super.hospitalId,
    required super.image,
    required super.userCode,
    required super.role,
    required super.hospitalName,
    required super.hospitalAddress,
    required super.hospitalRole,
    required super.hospitalCode,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      token: json['token'],
      username: json['username'],
      id: json['id'],
      password: json['password'],
      name: json['name'],
      specialize: json['specialize'],
      hospitalId: json['hospitalId'],
      image: json['image'],
      userCode: json['userCode'],
      role: json['role'],
      hospitalName: json['hospitalName'],
      hospitalAddress: json['hospitalAddress'],
      hospitalRole: json['hospitalRole'],
      hospitalCode: json['hospitalCode'],
    );
  }
  Map<String,dynamic>toJson(){
     return {
      'token': token,
      'username': username,
      'id': id,
      'password': password,
      'name': name,
      'specialize': specialize,
      'hospitalId': hospitalId,
      'image': image,
      'userCode': userCode,
      'role': role,
      'hospitalName': hospitalName,
      'hospitalAddress': hospitalAddress,
      'hospitalRole': hospitalRole,
      'hospitalCode': hospitalCode,
     };
  }
}
