
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mhi/features/patient/hospitals_and_doctors/data/models/booking_hospital_model.dart';
part 'all_hospitals_state.freezed.dart';
@freezed
class AllHospitalsState with _$AllHospitalsState {
  const factory AllHospitalsState.initial() = _Initial;
  const factory AllHospitalsState.loading() = _Loading;
  const factory AllHospitalsState.loaded(AllBookingHospitalsModel hospitals) = _Loaded;
  const factory AllHospitalsState.error(String message) = _Error;
}
