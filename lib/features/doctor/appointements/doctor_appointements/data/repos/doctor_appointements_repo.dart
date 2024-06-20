import 'package:mhi/core/networking/api/doctor/doctor_api_service.dart';
import 'package:mhi/core/networking/api_error_handler.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/data/models/doctor_appointement_model.dart';

class DoctorAppointementsRepo {
  final DoctorApiService apiService;

  DoctorAppointementsRepo({required this.apiService});

  Future<ApiResult<DoctorAppointements>> getDoctorAppointements(
      String id) async {
    try {
      final response = await apiService.getDoctorAppointments(id: id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
