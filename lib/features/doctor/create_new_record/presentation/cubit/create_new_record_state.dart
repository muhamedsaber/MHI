import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mhi/features/doctor/create_new_record/data/models/new_record_request_body.dart';

part 'create_new_record_state.freezed.dart';

@freezed
class CreateNewRecordState with _$CreateNewRecordState {
  const factory CreateNewRecordState.initial() = _Initial;
  const factory CreateNewRecordState.loading() = _Loading;
  const factory CreateNewRecordState.success(String message) = _Success;
  const factory CreateNewRecordState.error(String message) = _Error;
  const factory CreateNewRecordState.diagnoseUpdated(List<Diagnose>diagnoses ) =_DiagnoseUpdated;
  
}
