import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/config/database/cache/user_cache.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/auth/login/data/models/patient_model.dart';
import 'package:mhi/features/patient/appointements/data/models/patient_appointement_model.dart';
import 'package:mhi/features/patient/appointements/data/repos/get_patient_done_books_repo.dart';
import 'package:mhi/features/patient/appointements/presentation/logic/done_books/get_patinet_done_books_state.dart';

class GetPatinetDoneBooksCubit extends Cubit<GetPatinetDoneBooksState> {
  GetPatinetDoneBooksCubit({required this.repo})
      : super(const GetPatinetDoneBooksState.initial());
  final GetPatientDoneBooksRepo repo;
  Future<String> _getPatientId() async {
    PatientModel? model = await PatientCache().getUser();
    return model?.id ?? "";
  }

  getDoneAppointements() async {
    emit(const GetPatinetDoneBooksState.loading());
    final patientId = await _getPatientId();
    ApiResult<List<PatientAppointmentModel>> result =
        await repo.getPatientWaitingBooks(patientId: patientId);
    result.when(success: (books) {
      emit(GetPatinetDoneBooksState.loaded(books));
    }, failure: (error) {
      if (error.apiErrorModel.code == 404) {
        emit(const GetPatinetDoneBooksState.error(" لا توجد مواعيد "));
      } else {
        emit(GetPatinetDoneBooksState.error(
            error.apiErrorModel.message ?? "حدث خطأ ما"));
      }
    });
  }
}
