import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/config/database/cache/user_cache.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/patient/profile/update_profile/data/models/update_profile_request_body.dart';
import 'package:mhi/features/patient/profile/update_profile/data/models/update_profile_response_body.dart';
import 'package:mhi/features/patient/profile/update_profile/data/repos/update_profile_repo.dart';
import 'package:mhi/features/patient/profile/update_profile/presentation/Logic/update_patient_profile_state.dart';

class UpdatePatientProfileCubit extends Cubit<UpdatePatientProfileState> {
  UpdatePatientProfileCubit({
    required this.repo,
  }) : super(const UpdatePatientProfileState.initial());
  final UpdateProfileRepo repo;
  Future<String> _getPatientId() async {
    return await PatientCache().getUser().then((e) {
      return e?.id ?? "";
    });
  }

  TextEditingController mobildNumberController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  /// Update the patient profile
  updatePatientProfile({required String bloodType}) async {
    emit(const UpdatePatientProfileState.loading());
    String patientId = await _getPatientId();

    ApiResult<UpdateProfileResponseBody> response = await repo.updateProfile(
        updateProfileRequestBody: UpdateProfileRequestBody(
      address: addressController.text,
      bloodType: bloodType,
      height: heightController.text,
      mobileNumber: mobildNumberController.text,
      weight: weightController.text,
      patientId: patientId,
    ));

    response.when(
      success: (data) {
        emit(UpdatePatientProfileState.success(data.message));
      },
      failure: (error) {
        emit(UpdatePatientProfileState.error(
            error.apiErrorModel.message ?? "حدث خطأ ما"));
      },
    );
  }

  clear() {
    mobildNumberController.clear();
    heightController.clear();
    weightController.clear();
    addressController.clear();
  }
}
