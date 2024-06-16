import 'package:mhi/core/networking/api/patient/patient_api_service.dart';
import 'package:mhi/core/networking/api_error_handler.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';

class GetDoctorsByHospitalIdRepo {
  final PatientApiService apiService;
  GetDoctorsByHospitalIdRepo({required this.apiService});
  Future<ApiResult<BookDoctorsModel>> getDoctorsByHospitalId(
      {required String hospitalId}) async {
    try {
      BookDoctorsModel doctors = await apiService
          .getDoctorByHospitalId(body: {"hospitalID": hospitalId});
      return ApiResult.success(doctors);
    } catch (e) { 
   
      return ApiResult.failure(ErrorHandler.handle(e));
      
    }
  }
}
