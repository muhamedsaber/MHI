import 'package:dio/dio.dart';
import 'package:mhi/core/constants/api_constants.dart';

import 'package:retrofit/retrofit.dart';

part 'patient_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class PatientApiService {
  factory PatientApiService(Dio dio, {String baseUrl}) = _PatientApiService;
}
