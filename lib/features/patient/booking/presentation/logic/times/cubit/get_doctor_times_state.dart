
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_doctor_times_state.freezed.dart';
@freezed
class GetDoctorTimesState with _$GetDoctorTimesState {
  const factory GetDoctorTimesState.initial() = _Initial;
  const factory GetDoctorTimesState.loading() = _Loading;
  const factory GetDoctorTimesState.loaded(List<String> times) = _Loaded;
  const factory GetDoctorTimesState.error(String message) = _Error;

}
