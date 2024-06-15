import 'dart:developer';

import 'package:mhi/core/networking/api/common/common_api_service.dart';
import 'package:mhi/core/networking/api_error_handler.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/patient/booking/data/model/get_doctor_times_request_body.dart';

class GetDoctorTiemsRepo {
  final CommonApiService apiService;
  GetDoctorTiemsRepo({required this.apiService});
  Future<ApiResult<List<String>>> getDoctorTimesByDay({
    required String doctorId,
    required String day,
  }) async {
    try {
      dynamic times = await apiService.getDoctorTimes(
        doctorRequestBody: GetDoctorTimesRequestBody(
          doctorId: doctorId,
          day: day,
        ),
      );

      List<dynamic> innerListString = times as List<dynamic>;

      List<String> resultList = List<String>.from(innerListString[0]);

      return ApiResult.success(resultList);
    } catch (e) {
      log('error: ${e}');
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
