import 'package:mhi/core/networking/api/patient/patient_api_service.dart';
import 'package:mhi/core/networking/api_error_handler.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/specializes/models/specialize_model.dart';

class SpecializesRepository {
  final PatientApiService apiService;
  SpecializesRepository({required this.apiService});
  Future<ApiResult<List<SpecializeModel>>> getSpecializes() async {
    try {
      List<SpecializeModel> specializes = await apiService.getSpecializes();
      return ApiResult.success(specializes);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
