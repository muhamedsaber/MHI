import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/doctor/appointements/change_appointement_status/data/models/change_appointement_status_request_body.dart';
import 'package:mhi/features/doctor/appointements/change_appointement_status/data/models/change_appointement_status_response_body.dart';
import 'package:mhi/features/doctor/appointements/change_appointement_status/data/repos/change_appointment_status_repo.dart';
import 'package:mhi/features/doctor/appointements/change_appointement_status/presentation/logic/cubit/change_appointement_status_state.dart';

class ChangeAppointementStatusCubit
    extends Cubit<ChangeAppointementStatusState> {
  ChangeAppointementStatusCubit({
    required this.repo,
  }) : super(const ChangeAppointementStatusState.initial());
  final ChangeAppointmentStatusRepo repo;

  Future<void> changeAppointementStatus({
    required String bookingId,
    required String status,
  }) async {
    emit(const ChangeAppointementStatusState.loading());
    var request = ChangeAppointementsStatusRequestBody(
      bookingId: bookingId,
      status: status,
    );
    ApiResult<ChangeAppointementStatusResponseBody> result =
        await repo.changeAppointementStatus(body: request);
    result.when(
      success: (response) {
        emit(ChangeAppointementStatusState.success(
            response.message ?? "تم تعديل حالة الحجز بنجاح"));
      },
      failure: (error) {
        emit(ChangeAppointementStatusState.error(
            error.apiErrorModel.message ?? "حدث خطأ ما"));
      },
    );
  }
}
