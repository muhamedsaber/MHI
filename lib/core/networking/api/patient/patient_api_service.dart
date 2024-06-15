import 'package:dio/dio.dart';
import 'package:mhi/core/constants/api_constants.dart';
import 'package:mhi/features/patient/appointements/data/models/patient_appointement_model.dart';
import 'package:mhi/features/patient/booking/data/model/booking_request_body.dart';
import 'package:mhi/features/patient/booking/data/model/booking_response_body.dart';
import 'package:mhi/features/patient/hospitals/data/models/booking_hospital_model.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/specializes/models/specialize_model.dart';
import 'package:mhi/features/patient/medicines/mhi_medicines/data/mhi/models/mhi_medicine_model.dart';

import 'package:retrofit/retrofit.dart';

part 'patient_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class PatientApiService {
  factory PatientApiService(Dio dio, {String baseUrl}) = _PatientApiService;
  // get specializes
  @GET(ApiConstants.getSpecializesEndpoint)
  Future<List<SpecializeModel>> getSpecializes();

  // get all doctors in all hospitals
  @GET(ApiConstants.getAllDoctorsEndpoint)
  Future<BookDoctorsModel> getAllDoctors();

  // get doctors by specialize id
  @POST(ApiConstants.searchEndpoint)
  Future<BookDoctorsModel> getDoctorsBySpecialize(
      {@Body() required Map<String, dynamic> body});

  @GET(ApiConstants.getAllHospitalsEndPoint)
  Future<AllBookingHospitalsModel> getHospitals();

  @POST(ApiConstants.searchHospital)
  Future<BookDoctorsModel> getDoctorByHospitalId(
      {@Body() required Map<String, dynamic> body});

  @GET(ApiConstants.getAllMedicinesEndpoint)
  Future<MhiMedicineModel> getMedicines();

  @POST(ApiConstants.bookAppointementEndpoint)
  Future<BookingResponseBody> bookNewAppointment(
      {@Body() required BookingRequestBody boolingRequestBody});
  @GET("${ApiConstants.getPatientWaitingBooks}/{id}")
  Future<List<PatientAppointmentModel>>getWaitingBooks({
    @Path() required String id
  });
  @GET("${ApiConstants.getPatientDoneBooks}/{id}")
  Future<List<PatientAppointmentModel>>getDoneBooks({
    @Path() required String id
  });
  

}
