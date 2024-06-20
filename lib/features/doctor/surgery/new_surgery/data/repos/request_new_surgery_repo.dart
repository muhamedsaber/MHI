import 'package:mhi/core/networking/api/doctor/doctor_api_service.dart';
import 'package:mhi/core/networking/api_error_handler.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/doctor/surgery/new_surgery/data/models/request_new_suregery_response_body.dart';
import 'package:mhi/features/doctor/surgery/new_surgery/data/models/request_new_surgery_request_body.dart';

class RequestNewSurgeryRepo {
  final DoctorApiService apiService;

  RequestNewSurgeryRepo({required this.apiService});
  Future<ApiResult<RequestNewSurgeryResponseBody>> requestNewSurgery(
      {required RequestNewSurgeryRequestBody body}) async {
    try {
      RequestNewSurgeryResponseBody response =
          await apiService.requestNewSurgery(request: body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
