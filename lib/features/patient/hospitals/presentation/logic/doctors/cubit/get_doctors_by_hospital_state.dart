
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mhi/features/patient/doctors_and_specialize/search_for_doctors.dart/data/doctors/models/book_doctors_model.dart';
part 'get_doctors_by_hospital_state.freezed.dart';
@freezed
class GetDoctorsByHospitalState with _$GetDoctorsByHospitalState {
  const factory GetDoctorsByHospitalState.initial() = _Initial;
  const factory GetDoctorsByHospitalState.loading() = _Loading;
  const factory GetDoctorsByHospitalState.loaded(BookDoctorsModel doctors) = _Loaded;
  const factory GetDoctorsByHospitalState.error(String message) = _Error;

}
