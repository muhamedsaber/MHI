import 'package:dio/dio.dart';
import 'package:mhi/core/constants/api_constants.dart';
import 'package:mhi/features/common/medicines/open_fda/data/models/drug_result.dart';
import 'package:retrofit/http.dart';
part 'open_fda_api_service.g.dart';

@RestApi(baseUrl: OpenFdaApiConstants.baseUrl)
abstract class OpenFdaApiService {
  factory OpenFdaApiService(Dio dio, {String baseUrl}) = _OpenFdaApiService;

  @GET(OpenFdaApiConstants.lableJson)
  Future<DrugResult> getRandomDrugs({
    @Query('limit') int? limit = 50,
  });
  @GET(OpenFdaApiConstants.lableJson)
  Future<DrugResult> autoSearch({
    @Query('search') String? search,
    @Query('limit') int? limit = 10,
  });
}
