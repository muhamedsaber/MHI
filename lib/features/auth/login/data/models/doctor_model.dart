import 'package:mhi/features/auth/login/data/domain/user_entity.dart';

class DoctorModel extends UserEntity{
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

}
