import 'package:mhi/core/networking/api/doctor/doctor_api_service.dart';
import 'package:mhi/core/networking/api_error_handler.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/doctor/appointements/change_appointement_status/data/models/change_appointement_status_request_body.dart';
import 'package:mhi/features/doctor/appointements/change_appointement_status/data/models/change_appointement_status_response_body.dart';

class ChangeAppointmentStatusRepo {
  final DoctorApiService apiService;

  ChangeAppointmentStatusRepo({required this.apiService});
  Future<ApiResult<ChangeAppointementStatusResponseBody>>
      changeAppointementStatus(
          {required ChangeAppointementsStatusRequestBody body}) async {
    try {
      final response = await apiService.changeAppointementStatus(request: body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
