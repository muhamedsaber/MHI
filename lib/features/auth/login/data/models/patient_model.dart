import 'package:mhi/features/auth/login/data/domain/user_entity.dart';

class PatientModel extends UserEntity {
  PatientModel(
      {super.token,
      super.username,
      super.id,
      super.password,
      super.name,
      super.birthday,
      super.userCode,
      super.role,
      super.address,
      super.height,
      super.weight,
      super.mobileNumber,
      super.bloodType});
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
      address: json['address'],
      height: json['height'],
      weight: json['weight'],
      mobileNumber: json['mobileNumber'],
      bloodType: json['bloodType'],
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
      'address': address,
      'height': height,
      'weight': weight,
      'mobileNumber': mobileNumber,
      'bloodType': bloodType,
    };
  }

  @override
  String toString() {
    return 'PatientModel(token: $token, username: $username, id: $id, password: $password, name: $name, birthday: $birthday, userCode: $userCode, role: $role, address: $address, height: $height, weight: $weight, mobileNumber: $mobileNumber, bloodType: $bloodType)';
  }
}
