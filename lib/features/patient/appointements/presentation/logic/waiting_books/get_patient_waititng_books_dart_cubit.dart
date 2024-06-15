
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/config/database/cache/user_cache.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/auth/login/data/models/patient_model.dart';
import 'package:mhi/features/patient/appointements/data/models/patient_appointement_model.dart';
import 'package:mhi/features/patient/appointements/data/repos/get_patient_waiting_books.dart';
import 'package:mhi/features/patient/appointements/presentation/logic/waiting_books/get_patient_waititng_books_dart_state.dart';

class GetPatientWaititngBooksDartCubit
    extends Cubit<GetPatientWaititngBooksDartState> {
  GetPatientWaititngBooksDartCubit({required this.repo})
      : super(const GetPatientWaititngBooksDartState.initial());

  final GetPatientWaitingBooksRepo repo;
  Future<String> _getPatientId() async {
    PatientModel? model = await PatientCache().getUser();
    return model?.id ?? "";
  }

  getWaitingBooks() async {
    emit(const GetPatientWaititngBooksDartState.loading());
    final patientId = await _getPatientId();
    ApiResult<List<PatientAppointmentModel>> result =
        await repo.getPatientWaitingBooks(patientId: patientId);
    result.when(success: (books) {
      emit(GetPatientWaititngBooksDartState.loaded(books));
    }, failure: (error) {
      if (error.apiErrorModel.code == 404) {
        emit(GetPatientWaititngBooksDartState.error(
            error.apiErrorModel.message ?? "لا توجد مواعيد "));
      } else {
        log("${error.apiErrorModel.code}??");
        emit(GetPatientWaititngBooksDartState.error(
            error.apiErrorModel.message ?? "حدث خطأ غير معلوم"));
      }
    });
  }
}
