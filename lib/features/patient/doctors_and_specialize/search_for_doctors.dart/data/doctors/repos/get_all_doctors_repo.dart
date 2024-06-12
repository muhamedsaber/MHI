import 'package:mhi/core/networking/api/patient/patient_api_service.dart';
import 'package:mhi/core/networking/api_error_handler.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';

class GetAllDoctorsRepo {
  final PatientApiService apiService;
  GetAllDoctorsRepo({required this.apiService});
  Future<ApiResult<BookDoctorsModel>> getAllDoctors() async {
    try {
      BookDoctorsModel response = await apiService.getAllDoctors();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
