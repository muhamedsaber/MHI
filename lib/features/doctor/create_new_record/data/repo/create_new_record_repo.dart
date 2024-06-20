import 'package:mhi/core/networking/api/doctor/doctor_api_service.dart';
import 'package:mhi/core/networking/api_error_handler.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/doctor/create_new_record/data/models/new_record_request_body.dart';

class CreateNewRecordRepo {
  final DoctorApiService apiService;

  CreateNewRecordRepo({required this.apiService});

  Future<ApiResult<String>> createNewRecord(
      NewRecordRequestBody request) async {
    try {
      await apiService.createNewRecord(record: request);
      return const ApiResult.success("");
    } on Failure catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
