import 'package:freezed_annotation/freezed_annotation.dart';
part 'booking_process_state.freezed.dart';

@freezed
class BookingProcessState with _$BookingProcessState {
  const factory BookingProcessState.initial() = _Initial;
  const factory BookingProcessState.loading() = _Loading;
  const factory BookingProcessState.loaded() = _Loaded;
  const factory BookingProcessState.error(String error) = _Error;
}
