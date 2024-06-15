

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mhi/features/patient/appointements/data/models/patient_appointement_model.dart';
part 'get_patinet_done_books_state.freezed.dart';
@freezed
class GetPatinetDoneBooksState with _$GetPatinetDoneBooksState {
  const factory GetPatinetDoneBooksState.initial() = _Initial;
  const factory GetPatinetDoneBooksState.loading() = _Loading;
  const factory GetPatinetDoneBooksState.loaded(List<PatientAppointmentModel> books) = _Loaded;
  const factory GetPatinetDoneBooksState.error(String message) = _Error;
}
