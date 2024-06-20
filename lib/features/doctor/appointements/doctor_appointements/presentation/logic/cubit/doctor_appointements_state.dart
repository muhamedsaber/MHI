
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mhi/features/doctor/appointements/doctor_appointements/data/models/doctor_appointement_model.dart';
part 'doctor_appointements_state.freezed.dart';
@freezed
class DoctorAppointementsState with _$DoctorAppointementsState {
  const factory DoctorAppointementsState.initial() = _Initial;
  const factory DoctorAppointementsState.loading() = _Loading;
  const factory DoctorAppointementsState.success(
      DoctorAppointements responseBody) = _Success;
  const factory DoctorAppointementsState.error(String message) = _Error;
  
}
