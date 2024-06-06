import 'dart:developer';

import 'package:mhi/core/networking/api/common/common_api_service.dart';
import 'package:mhi/core/networking/api_error_handler.dart';
import 'package:mhi/core/networking/api_result.dart';

import 'package:mhi/features/auth/signup/data/models/signup_response_body.dart';
import 'package:mhi/features/auth/signup/data/models/sigunp_request_body.dart';

class SignupRepository {
  final CommonApiService apiService;
  SignupRepository({required this.apiService});
  Future<ApiResult<SignupResponse>> signupUser(
      {required SignupRequestBody signipRequestBudy}) async {
    try {
      SignupResponse response =
          await apiService.signupPatient(signupRequestBody: signipRequestBudy);
      return ApiResult.success(response);
    } catch (e) {
      log(e.toString());
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
