import 'package:mhi/core/networking/api/patient/patient_api_service.dart';
import 'package:mhi/core/networking/api_error_handler.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/common/medicines/mhi_medicines/data/mhi/models/mhi_medicine_model.dart';

class MhiMedicineRepo {
  final PatientApiService apiService;
  MhiMedicineRepo({required this.apiService});
  Future<ApiResult<MhiMedicineModel>> getMedicines() async {
   try {
      MhiMedicineModel model = await apiService.getMedicines();
      return ApiResult.success(model);
   } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
   }

  }
}
