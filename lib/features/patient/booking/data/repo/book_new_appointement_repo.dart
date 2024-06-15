import 'package:mhi/core/networking/api/patient/patient_api_service.dart';
import 'package:mhi/core/networking/api_error_handler.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/patient/booking/data/model/booking_request_body.dart';
import 'package:mhi/features/patient/booking/data/model/booking_response_body.dart';

class BookNewAppointementRepo {
  final PatientApiService apiService;

  BookNewAppointementRepo({required this.apiService});
  Future<ApiResult<BookingResponseBody>> bookNewAppointement(
      {required BookingRequestBody boolingRequestBody}) async {
    try {
      BookingResponseBody body = await apiService.bookNewAppointment(
          boolingRequestBody: boolingRequestBody);
      return ApiResult.success(body);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
