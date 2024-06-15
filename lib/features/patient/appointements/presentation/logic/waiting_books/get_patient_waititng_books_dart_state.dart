
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mhi/features/patient/appointements/data/models/patient_appointement_model.dart';
part 'get_patient_waititng_books_dart_state.freezed.dart';
@freezed
class GetPatientWaititngBooksDartState with _$GetPatientWaititngBooksDartState {
  const factory GetPatientWaititngBooksDartState.initial() = _Initial;
  const factory GetPatientWaititngBooksDartState.loading() = _Loading;
  const factory GetPatientWaititngBooksDartState.loaded(List<PatientAppointmentModel>books) = _Loaded;
  const factory GetPatientWaititngBooksDartState.error(String message) = _Error;
}
