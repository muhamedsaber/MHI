import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/config/database/cache/user_cache.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/auth/login/data/models/patient_model.dart';
import 'package:mhi/features/patient/booking/data/model/booking_request_body.dart';
import 'package:mhi/features/patient/booking/data/model/booking_response_body.dart';
import 'package:mhi/features/patient/booking/data/repo/book_new_appointement_repo.dart';
import 'package:mhi/features/patient/booking/presentation/logic/booking_process/cubit/booking_process_state.dart';

class BookingProcessCubit extends Cubit<BookingProcessState> {
  BookingProcessCubit({required this.repo})
      : super(const BookingProcessState.initial());
  final BookNewAppointementRepo repo;
  Future<String> _getPatientId() async {
    PatientModel? patientModel = await PatientCache().getUser();
    return patientModel?.id ?? "";
  }

  bookNewAppointement(
      {required String date,
      required String time,
      required String doctorId}) async {
    emit(const BookingProcessState.loading());
    String patientId = await _getPatientId();
    ApiResult<BookingResponseBody> response = await repo.bookNewAppointement(
        boolingRequestBody: BookingRequestBody(
            day: date, time: time, patientId: patientId, doctorId: doctorId));

    response.when(
      success: (data) => emit(const BookingProcessState.loaded()),
      failure: (error) => emit(BookingProcessState.error(
          error.apiErrorModel.message ?? "حدث خطأ ما")),
    );
  }
}
