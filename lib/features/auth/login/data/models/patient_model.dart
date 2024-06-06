import 'package:mhi/features/auth/login/data/domain/user_entity.dart';

class PatientModel extends UserEntity {
  PatientModel({
    required super.token,
    required super.username,
    required super.id,
    required super.password,
    required super.name,
    required super.birthday,
    required super.userCode,
    required super.role,
  });
  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      token: json['token'],
      username: json['username'],
      id: json['id'],
      password: json['password'],
      name: json['name'],
      birthday: json['birthday'],
      userCode: json['userCode'],
      role: json['role'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'username': username,
      'id': id,
      'password': password,
      'name': name,
      'birthday': birthday,
      'userCode': userCode,
      'role': role,
    };
  }
}
