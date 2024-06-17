import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/patient/booking/data/repo/get_doctor_days_repo.dart';
import 'package:mhi/features/patient/booking/presentation/logic/dates/cubit/get_doctor_days_state.dart';

class GetDoctorDaysCubit extends Cubit<GetDoctorDaysState> {
  GetDoctorDaysCubit({
    required this.getDoctorDaysRepo,
  }) : super(const GetDoctorDaysState.initial());

  final GetDoctorDaysRepo getDoctorDaysRepo;

  getDoctorDaysById({required String doctorId}) async {
    emit(const GetDoctorDaysState.loading());
    ApiResult<List<String?>?>? result =
        await getDoctorDaysRepo.getDoctorDays(doctorId: doctorId);
    result.when(success: (data) {
      log("getDoctorDaysById: ${_handleDates(data)}");
      emit(GetDoctorDaysState.loaded(_handleDates(data)));
    }, failure: (error) {
      emit(GetDoctorDaysState.error(
          error.apiErrorModel.message ?? "حدث خطأ ما"));
    });
  }

  List<String> _handleDates(List<String?>? dates) {
    List<String> availableDates = [];
    dates?.forEach((element) {
      if (element != null) {
        availableDates.add(element);
      }
    });
    return availableDates;
  }
}
