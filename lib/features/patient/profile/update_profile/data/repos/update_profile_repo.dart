import 'dart:developer';

import 'package:mhi/core/networking/api/patient/patient_api_service.dart';
import 'package:mhi/core/networking/api_error_handler.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/patient/profile/update_profile/data/models/update_profile_request_body.dart';
import 'package:mhi/features/patient/profile/update_profile/data/models/update_profile_response_body.dart';

class UpdateProfileRepo {
  final PatientApiService apiService;
  UpdateProfileRepo({required this.apiService});
  Future<ApiResult<UpdateProfileResponseBody>> updateProfile(
      {required UpdateProfileRequestBody updateProfileRequestBody}) async {
    try {
      UpdateProfileResponseBody response =
          await apiService.updatePatientProfile(
              updateProfileRequestBody: updateProfileRequestBody);

      return ApiResult.success(response);
    } catch (e) {
      log(e.toString());
      return ApiResult.failure(ErrorHandler.handle(e));
      
    }
  }
}
