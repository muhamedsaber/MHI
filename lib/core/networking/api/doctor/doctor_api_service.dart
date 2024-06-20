import 'package:dio/dio.dart';
import 'package:mhi/core/constants/api_constants.dart';
import 'package:mhi/features/doctor/appointements/books_count/data/models/doctor_books_count_response_body.dart';
import 'package:mhi/features/doctor/appointements/change_appointement_status/data/models/change_appointement_status_request_body.dart';
import 'package:mhi/features/doctor/appointements/change_appointement_status/data/models/change_appointement_status_response_body.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/data/models/doctor_appointement_model.dart';
import 'package:mhi/features/doctor/create_new_record/data/models/new_record_request_body.dart';
import 'package:mhi/features/doctor/surgery/new_surgery/data/models/request_new_suregery_response_body.dart';
import 'package:mhi/features/doctor/surgery/new_surgery/data/models/request_new_surgery_request_body.dart';
import 'package:mhi/features/doctor/surgery/surgeries/data/models/surgery_model.dart';
import 'package:retrofit/http.dart';

part 'doctor_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class DoctorApiService {
  factory DoctorApiService(Dio dio, {String baseUrl}) = _DoctorApiService;

  @GET("${ApiConstants.countDoctorBooksEndpoint}/{id}")
  Future<DoctorBooksCountResponseBody> getDoctorBooksCount(
      {@Path() required String id});

  @GET("${ApiConstants.showDoctorBooksEndpoint}/{id}")
  Future<DoctorAppointements> getDoctorAppointments({
    @Path() required String id,
  });

  @POST(ApiConstants.createPatientRecordEndpoint)
  Future<void> createNewRecord({@Body() required NewRecordRequestBody record});

  @POST(ApiConstants.requestSurgeryEndpoint)
  Future<RequestNewSurgeryResponseBody> requestNewSurgery(
      {@Body() required RequestNewSurgeryRequestBody request});

  @PATCH(ApiConstants.changeDoctorBookingStatusEndpoint)
  Future<ChangeAppointementStatusResponseBody> changeAppointementStatus({
    @Body() ChangeAppointementsStatusRequestBody? request,
  });

  @GET("${ApiConstants.getDoctorSurgeryEndpoint}/{doctorId}")
  Future<List<SurgeryModel>> getDoctorAppointmentsByDate({
    @Path() required String doctorId,
  });
}
