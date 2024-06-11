import 'package:mhi/core/networking/api/patient/patient_api_service.dart';
import 'package:mhi/core/networking/api_error_handler.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/patient/search/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';

class GetDoctorBySpecialize {
  final PatientApiService service;
  GetDoctorBySpecialize({required this.service});
  Future<ApiResult<BookDoctorsModel>> getDoctorsBySpecialize(
      {required String specializeID}) async {
    try {
      final BookDoctorsModel model = await service.getDoctorsBySpecialize(body: {"specialize": specializeID} ,
         );
      return ApiResult.success(model);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
