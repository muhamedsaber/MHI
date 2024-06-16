import 'package:mhi/core/networking/api/common/common_api_service.dart';
import 'package:mhi/core/networking/api_error_handler.dart';
import 'package:mhi/core/networking/api_error_model.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/auth/login/data/domain/user_entity.dart';
import 'package:mhi/features/auth/login/data/domain/user_mapper.dart';
import 'package:mhi/features/auth/login/data/models/login_request_body.dart';
import 'package:mhi/features/auth/login/data/models/login_response_body.dart';

class LoginRepository {
  final CommonApiService apiService;
  LoginRepository({required this.apiService});
  Future<ApiResult<UserEntity>> loginUser(
      {required LoginRequestBody loginRequestBody}) async {
    try {
      LoginResponseBody response =
          await apiService.login(loginRequestBody: loginRequestBody);
      UserEntity? entity = UserMapper.mapLoginResponseToUser(response);
      if (entity != null) {
        return ApiResult.success(entity);
      } else {
        return ApiResult.failure(ErrorHandler.handle(
            ApiErrorModel(message: "حدث خطأ ما", code: 500)));
      }
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
