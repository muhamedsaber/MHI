import 'package:mhi/core/networking/api/common/common_api_service.dart';
import 'package:mhi/core/networking/api_error_handler.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/common/records/data/models/patient_record_model.dart';

class PatientRecordRepo{
  final CommonApiService service;
  PatientRecordRepo({required this.service});
 Future<ApiResult<List<PatientRecordModel>>> getRecords({required String? patientId}) async {
    try {
      List<PatientRecordModel> records = await service.getPatientRecords(patientId: patientId);
      return ApiResult.success(records);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}