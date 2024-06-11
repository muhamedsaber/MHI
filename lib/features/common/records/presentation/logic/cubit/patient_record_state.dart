import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mhi/features/common/records/data/models/patient_record_model.dart';

part 'patient_record_state.freezed.dart';
@freezed
class PatientRecordState with _$PatientRecordState {
  const factory PatientRecordState.initial() = _Initial;
  const factory PatientRecordState.loading() = Loading;
  const factory PatientRecordState.loaded(List<PatientRecordModel> records) =
      Loaded;
  const factory PatientRecordState.error(String message) = Error;
}
