


import 'package:dio/dio.dart';
import 'package:mhi/core/constants/api_constants.dart';
import 'package:retrofit/http.dart';

part 'doctor_api_service.g.dart';
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class DoctorApiService{
  factory DoctorApiService(Dio dio, {String baseUrl}) = _DoctorApiService;
  
}