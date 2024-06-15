import 'package:mhi/core/networking/api/patient/patient_api_service.dart';
import 'package:mhi/core/networking/api_error_handler.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/patient/appointements/data/models/patient_appointement_model.dart';

class GetPatientWaitingBooksRepo {
  final PatientApiService apiService;
  GetPatientWaitingBooksRepo({required this.apiService});
  Future<ApiResult<List<PatientAppointmentModel>>> getPatientWaitingBooks(
      {required String patientId}) async {
    try {
      final response = await apiService.getWaitingBooks(id: patientId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
