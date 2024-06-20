import 'package:mhi/core/networking/api/open_fda/open_fda_api_service.dart';
import 'package:mhi/core/networking/api_error_handler.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/common/medicines/open_fda/data/models/drug_result.dart';

class AutoOpenfdaDrugRepo {
  final OpenFdaApiService openFdaApiService;

  AutoOpenfdaDrugRepo({required this.openFdaApiService});
  Future<ApiResult<DrugResult>> autoSearch(
      {String? search, int? limit = 10}) async {
    try {
      final result =
          await openFdaApiService.autoSearch(search: search, limit: limit);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
