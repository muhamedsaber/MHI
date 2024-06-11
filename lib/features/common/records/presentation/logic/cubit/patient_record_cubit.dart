import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/config/database/local/patient/patient_record_database.dart';
import 'package:mhi/core/helper/alerts.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/core/helper/extensions.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/common/records/data/models/patient_record_model.dart';
import 'package:mhi/features/common/records/data/repos/patient_record_repo.dart';
import 'package:mhi/features/common/records/presentation/logic/cubit/patient_record_state.dart';

class PatientRecordCubit extends Cubit<PatientRecordState> {
  PatientRecordCubit({required this.repo})
      : super(const PatientRecordState.initial());
  final PatientRecordRepo repo;
  late List<PatientRecordModel> allRecords;
  final PatientRecordDatabase _recordsDatabase = PatientRecordDatabase();
  // get patient records from The API
  getPatientRecordsFromApi({required String patientId}) async {
    emit(const PatientRecordState.loading());
    ApiResult<List<PatientRecordModel>> records =
        await repo.getRecords(patientId: patientId);
    records.when(
      success: (data) {
        allRecords = data;
        emit(PatientRecordState.loaded(data));
      },
      failure: (error) => emit(PatientRecordState.error(
          error.apiErrorModel.message ?? "حدث خطأ ما")),
    );
  }

  /// search on records
  filterRecords(String? input) {
    List<PatientRecordModel> filtered = [];
    if (input.isNullOrEmpty()) {
      emit(PatientRecordState.loaded(allRecords));
    } else if (input != null || input!.isNotEmpty) {
      filtered = allRecords
          .where((element) =>
              element.medicine!.contains(input) ||
              element.diagnose!.contains(input) ||
              element.doctor!.name!.contains(input))
          .toList();
      emit(PatientRecordState.loaded(filtered));
    }
  }

  // sort records from newest to oldest
  sortFromNewestToOldest() {
    if (allRecords.isEmpty) {
      Alerts().showCustomToast(
          message: "الرجاء الأنتظار", color: AppColors.deepBlue);
    }
    log("sortFromNewestToOldest");
    allRecords.sort((a, b) => b.date!.compareTo(a.date!));
    emit(PatientRecordState.loaded(allRecords));
  }

  // sort records from oldest to newest
  sortFromOldestToNewest() {
    log("sortFromOldestToNewest");
    allRecords.sort((a, b) => a.date!.compareTo(b.date!));
    emit(PatientRecordState.loaded(allRecords));
  }

}
