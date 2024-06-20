import 'package:mhi/core/networking/api/doctor/doctor_api_service.dart';
import 'package:mhi/core/networking/api_error_handler.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/doctor/surgery/surgeries/data/models/surgery_model.dart';

class GetDoctorSurgeriesRepo {
  final DoctorApiService apiService;

  GetDoctorSurgeriesRepo({required this.apiService});

  Future<ApiResult<List<SurgeryModel>>> getSurgeries(
      {required String doctorId}) async {
    try {
      final response =
          await apiService.getDoctorAppointmentsByDate(doctorId: doctorId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
