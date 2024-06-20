import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mhi/features/doctor/surgery/new_surgery/data/models/request_new_suregery_response_body.dart';
part 'request_new_surgery_state.freezed.dart';

@freezed
class RequestNewSurgeryState with _$RequestNewSurgeryState {
  const factory RequestNewSurgeryState.initial() = _Initial;
  const factory RequestNewSurgeryState.loading() = _Loading;
  const factory RequestNewSurgeryState.loaded(
      RequestNewSurgeryResponseBody response) = _Loaded;
  const factory RequestNewSurgeryState.error(String message) = _Error;
}
