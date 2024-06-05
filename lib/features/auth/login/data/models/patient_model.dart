import 'package:mhi/features/auth/login/data/domain/user_entity.dart';

class PatientModel extends UserEntity {
  PatientModel({
   required super.token,
  required  super.username,
   required super.id,
   required super.password,
   required super.name,
  required  super.birthday,
  required  super.userCode,
  required  super.role,
  });
}
