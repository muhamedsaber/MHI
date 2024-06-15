import 'package:mhi/core/networking/api/common/common_api_service.dart';
import 'package:mhi/core/networking/api_error_handler.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/patient/booking/data/model/get_doctor_days_request_body.dart';

class GetDoctorDaysRepo {
  final CommonApiService apiService;

  GetDoctorDaysRepo({required this.apiService});

  Future<ApiResult<List<String?>?>> getDoctorDays(
      {required String doctorId}) async {
    try {
      List<String?>? dayse = await apiService.getDoctorDays(
          doctorRequestBody: GetDoctorDaysRequestBody(doctorId: doctorId));

      return ApiResult.success(dayse??[]);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
