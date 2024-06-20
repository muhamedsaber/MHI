import 'package:dio/dio.dart';
import 'package:mhi/core/constants/api_constants.dart';
import 'package:mhi/features/auth/login/data/models/login_request_body.dart';
import 'package:mhi/features/auth/login/data/models/login_response_body.dart';
import 'package:mhi/features/auth/signup/data/models/signup_response_body.dart';
import 'package:mhi/features/auth/signup/data/models/sigunp_request_body.dart';
import 'package:mhi/features/common/records/data/models/patient_record_model.dart';
import 'package:mhi/features/patient/booking/data/model/get_doctor_days_request_body.dart';
import 'package:mhi/features/patient/booking/data/model/get_doctor_times_request_body.dart';
import 'package:retrofit/http.dart';

part 'common_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class CommonApiService {
  factory CommonApiService(Dio dio, {String baseUrl}) = _CommonApiService;

  @POST(ApiConstants.authEndpoint)
  Future<LoginResponseBody> login({@Body() LoginRequestBody? loginRequestBody});

  @POST(ApiConstants.signupPatientEndpoint)
  Future<SignupResponse> signupPatient(
      {@Body() SignupRequestBody? signupRequestBody});

  @GET("${ApiConstants.getPatientRecords}/{patientId}")
  Future<List<PatientRecordModel>> getPatientRecords(
      {@Path() required String? patientId});

  /// getDoctor Available [days] for bookind
  @POST(ApiConstants.getDoctorDaysEndpoint)
  Future<List<String?>?> getDoctorDays({@Body() required GetDoctorDaysRequestBody doctorRequestBody});

 @POST(ApiConstants.getDoctorTimesEndpoint)
  Future<dynamic> getDoctorTimes({@Body() required GetDoctorTimesRequestBody doctorRequestBody});
 
}
