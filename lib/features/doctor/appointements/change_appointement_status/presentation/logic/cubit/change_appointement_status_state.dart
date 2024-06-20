
import 'package:freezed_annotation/freezed_annotation.dart';
part 'change_appointement_status_state.freezed.dart';
@freezed
class ChangeAppointementStatusState with _$ChangeAppointementStatusState {
  const factory ChangeAppointementStatusState.initial() = _Initial;
  const factory ChangeAppointementStatusState.loading() = _Loading;
  const factory ChangeAppointementStatusState.success(String message) = _Success;
  const factory ChangeAppointementStatusState.error(String message) = _Error;
}
