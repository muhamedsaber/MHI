
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_doctor_days_state.freezed.dart';
@freezed
class GetDoctorDaysState with _$GetDoctorDaysState {
  const factory GetDoctorDaysState.initial() = _Initial;
  const factory GetDoctorDaysState.loading() = Loading;
  const factory GetDoctorDaysState.loaded(List<String> days) = Loaded;
  const factory GetDoctorDaysState.error(String message) = Error;
}
