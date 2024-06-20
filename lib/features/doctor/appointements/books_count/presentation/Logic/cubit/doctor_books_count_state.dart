import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mhi/features/doctor/appointements/books_count/data/models/doctor_books_count_response_body.dart';
part 'doctor_books_count_state.freezed.dart';

@freezed
class DoctorBooksCountState with _$DoctorBooksCountState {
  const factory DoctorBooksCountState.initial() = _Initial;
  const factory DoctorBooksCountState.loading() = _Loading;
  const factory DoctorBooksCountState.success(
      DoctorBooksCountResponseBody response) = _Success;
  const factory DoctorBooksCountState.error(String message) = _Error;
}
