
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mhi/features/doctor/surgery/surgeries/data/models/surgery_model.dart';
part 'get_doctor_surgeries_state.freezed.dart';
@freezed
class GetDoctorSurgeriesState with _$GetDoctorSurgeriesState {
  const factory GetDoctorSurgeriesState.initial() = _Initial;
  const factory GetDoctorSurgeriesState.loading() = _Loading;
  const factory GetDoctorSurgeriesState.success(List<SurgeryModel> surgeries) = _Success;
  const factory GetDoctorSurgeriesState.error(String message) = _Error;
}
