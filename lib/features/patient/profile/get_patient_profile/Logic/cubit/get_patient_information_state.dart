import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mhi/features/auth/login/data/models/patient_model.dart';
part 'get_patient_information_state.freezed.dart';

@freezed
class GetPatientInformationState with _$GetPatientInformationState {
  const factory GetPatientInformationState.initial() = _Initial;
  const factory GetPatientInformationState.loading() = _Loading;
  const factory GetPatientInformationState.loaded(PatientModel message) = _Loaded;
  const factory GetPatientInformationState.error(String message) = _Error;
}
