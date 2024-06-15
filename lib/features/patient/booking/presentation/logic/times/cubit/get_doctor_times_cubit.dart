import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/patient/booking/data/repo/get_doctor_times_repo.dart';
import 'package:mhi/features/patient/booking/presentation/logic/times/cubit/get_doctor_times_state.dart';

class GetDoctorTimesCubit extends Cubit<GetDoctorTimesState> {
  GetDoctorTimesCubit({required this.repo})
      : super(const GetDoctorTimesState.initial());
  final GetDoctorTiemsRepo repo;

  getDoctorTiems({
    required String doctorId,
    required String day,
  }) async {
    emit(const GetDoctorTimesState.loading());
    log("message");
    ApiResult<List<String>> result =
        await repo.getDoctorTimesByDay(doctorId: doctorId, day: day);
    result.when(success: (data) {
      log("getDoctorTimes: ${_handleTimes(data)}");
      emit(GetDoctorTimesState.loaded(_handleTimes(data)));
    }, failure: (error) {
      log("error: ${error.apiErrorModel.message}");
      emit(GetDoctorTimesState.error(
          error.apiErrorModel.message ?? "حدث خطأ ما"));
    });
  }

  _handleTimes(List<String?>? times) {
    List<String> availableTimes = [];
    times?.forEach((element) {
      if (element != null) {
        availableTimes.add(element);
      }
    });
    return availableTimes;
  }

  clearTimes() {
    emit(const GetDoctorTimesState.initial());
  }
}
