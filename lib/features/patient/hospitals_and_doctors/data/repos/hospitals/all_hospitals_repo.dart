import 'package:mhi/core/networking/api/patient/patient_api_service.dart';
import 'package:mhi/core/networking/api_error_handler.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/patient/hospitals_and_doctors/data/models/booking_hospital_model.dart';

class AllHospitalsRepo {
  final PatientApiService apiService;

  AllHospitalsRepo(this.apiService);

  Future<ApiResult<AllBookingHospitalsModel>> getAllHospitals() async {
    try {
      AllBookingHospitalsModel allHospitals = await apiService.getHospitals();
      return ApiResult.success(allHospitals);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
