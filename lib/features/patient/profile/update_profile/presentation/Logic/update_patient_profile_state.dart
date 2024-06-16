
import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_patient_profile_state.freezed.dart';
@freezed
class UpdatePatientProfileState with _$UpdatePatientProfileState {
  const factory UpdatePatientProfileState.initial() = _Initial;
  const factory UpdatePatientProfileState.loading() = _Loading;
  const factory UpdatePatientProfileState.success(String message) = _Success;
  const factory UpdatePatientProfileState.error(String error) = _Error;
}
