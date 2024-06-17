import 'package:mhi/core/networking/api/patient/patient_api_service.dart';
import 'package:mhi/core/networking/api_error_handler.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/patient/profile/get_patient_profile/data/models/updated_patient_profile_model.dart';

class GetUpdatedPatientProfileRepo {
  final PatientApiService apiService;
  GetUpdatedPatientProfileRepo({required this.apiService});
  Future<ApiResult<UpdatedPatientProfileModel>> getUpdatedPatientProfile({
    required String patientId,
  }) async {
    try {
      UpdatedPatientProfileModel response =
          await apiService.getUpdatedProfile(id: patientId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
