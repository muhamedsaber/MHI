import 'package:mhi/core/networking/api/open_fda/open_fda_api_service.dart';
import 'package:mhi/core/networking/api_error_handler.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/common/medicines/open_fda/data/models/drug_result.dart';

class RandomOpenfdaDrugRepo {
  final OpenFdaApiService openFdaApiService;

  RandomOpenfdaDrugRepo({required this.openFdaApiService});

  Future<ApiResult<DrugResult>> getRandomDrugs({int? limit = 50}) async {
    try {
      DrugResult result = await openFdaApiService.getRandomDrugs(limit: limit);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
