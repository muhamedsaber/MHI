import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/patient/hospitals/data/repos/doctors/get_doctors_by_hospital_id.dart';
import 'package:mhi/features/patient/hospitals/presentation/logic/doctors/cubit/get_doctors_by_hospital_state.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';

class GetDoctorsByHospitalCubit extends Cubit<GetDoctorsByHospitalState> {
  GetDoctorsByHospitalCubit({required this.getDoctorsByHospitalId})
      : super(const GetDoctorsByHospitalState.initial());

  final GetDoctorsByHospitalIdRepo getDoctorsByHospitalId;

  getDoctors({required String hospitalId}) async {
   
    emit(const GetDoctorsByHospitalState.loading());
    ApiResult<BookDoctorsModel> result = await getDoctorsByHospitalId
        .getDoctorsByHospitalId(hospitalId: hospitalId);
    result.when(success: (data) {
      emit(GetDoctorsByHospitalState.loaded(data));
    }, failure: (error) {
      emit(GetDoctorsByHospitalState.error(
          error.apiErrorModel.message ?? " حدث خطأ ما"));
    });
  }
  
}
