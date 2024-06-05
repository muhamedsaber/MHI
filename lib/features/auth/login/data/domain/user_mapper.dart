import 'package:mhi/core/networking/api_error_handler.dart';
import 'package:mhi/core/networking/api_error_model.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/auth/login/data/domain/user_entity.dart';
import 'package:mhi/features/auth/login/data/models/doctor_model.dart';
import 'package:mhi/features/auth/login/data/models/login_response_body.dart';
import 'package:mhi/features/auth/login/data/models/patient_model.dart';

class UserMapper {
  static ApiResult<UserEntity> mapLoginResponseToUser(
      LoginResponseBody response) {
    if (response.user!.role == "doctor") {
      return ApiResult.success(DoctorModel(
        token: response.token,
        username: response.user!.username,
        id: response.user!.id,
        password: response.user!.password,
        name: response.user!.name,
        specialize: response.user!.specialize,
        hospitalId: response.user!.hospitalId,
        image: response.user!.image,
        userCode: response.user!.code,
        hospitalAddress: response.hospitalDetails!.address,
        hospitalCode: response.hospitalDetails!.code,
        hospitalName: response.hospitalDetails!.name,
        hospitalRole: response.hospitalDetails!.role,
        role: response.user!.role,
      ));
    } else if (response.user!.role == "patient") {
      return ApiResult.success(PatientModel(
        token: response.token,
        username: response.user!.username,
        id: response.user!.id,
        password: response.user!.password,
        name: response.user!.name,
        birthday: response.user!.birthday,
        userCode: response.user!.code,
        role: response.user!.role,
      ));
    } else {
      return ApiResult.failure(
        ErrorHandler.handle(
          ApiErrorModel(message: "Invalid Role", code: 400),
        ),
      );
    }
  }
}
