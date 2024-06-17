import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/config/database/cache/user_cache.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/auth/login/data/models/patient_model.dart';
import 'package:mhi/features/patient/profile/get_patient_profile/data/models/updated_patient_profile_model.dart';
import 'package:mhi/features/patient/profile/get_patient_profile/data/repo/get_updated_patient_profile_repo.dart';
import 'package:mhi/features/patient/profile/get_patient_profile/Logic/cubit/get_patient_information_state.dart';

class GetPatientInformationCubit extends Cubit<GetPatientInformationState> {
  GetPatientInformationCubit({required this.repo})
      : super(const GetPatientInformationState.initial());
  final GetUpdatedPatientProfileRepo repo;

  getPatientFromCache() async {
    try {
      PatientModel? model = await PatientCache().getUser();
      if (model != null) {
        emit(GetPatientInformationState.loaded(model));
      } else {
        emit(const GetPatientInformationState.error(
            "بيانات المستخدم غير موجودة"));
      }
    } catch (e) {
      emit(GetPatientInformationState.error(e.toString()));
    }
  }

  getUpdatedPatientInformationFromApi() async {
    PatientModel model = await _getPatientModel();
    ApiResult<UpdatedPatientProfileModel> patient =
        await repo.getUpdatedPatientProfile(patientId: model.id ?? "");
    patient.when(success: (data) async {
      bool isCacheUpdated = await _updateCache(data);

      if (isCacheUpdated) {
        PatientModel model = await _getPatientModel();
        emit(GetPatientInformationState.loaded(model));
      } else {
        emit(const GetPatientInformationState.error(
            "حدث خطأ أثناء تحديث البيانات"));
      }
    }, failure: (error) {
      emit(GetPatientInformationState.error(
          error.apiErrorModel.message ?? "حدث خطأ ما"));
    });
  }

  Future<bool> _updateCache(PatientModel model) async {
    try {
      PatientCache cache = PatientCache();
      await cache.updateUserProfile(user: model);
      log("Cache Updated");

      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<PatientModel> _getPatientModel() async {
    PatientCache cache = PatientCache();
    return await cache.getUser() ?? PatientModel();
  }
}
