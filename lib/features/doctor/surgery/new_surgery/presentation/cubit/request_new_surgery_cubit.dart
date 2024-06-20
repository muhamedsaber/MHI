import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/config/database/cache/user_cache.dart';
import 'package:mhi/core/helper/alerts.dart';
import 'package:mhi/core/helper/app_colors.dart';
import 'package:mhi/features/auth/login/data/models/doctor_model.dart';
import 'package:mhi/features/doctor/surgery/new_surgery/data/models/request_new_surgery_request_body.dart';
import 'package:mhi/features/doctor/surgery/new_surgery/data/repos/request_new_surgery_repo.dart';
import 'package:mhi/features/doctor/surgery/new_surgery/presentation/cubit/request_new_surgery_state.dart';

class RequestNewSurgeryCubit extends Cubit<RequestNewSurgeryState> {
  RequestNewSurgeryCubit(this.repo)
      : super(const RequestNewSurgeryState.initial());
  final RequestNewSurgeryRepo repo;
  final TextEditingController descriptionController = TextEditingController();
  String? specialize;
  Future<String> _getDoctorId() async {
    DoctorModel? model = await DoctorCache().getUser();
    return model?.id ?? "";
  }

  String? hospitalId;

  requestNewSurgery({
    required String patientId,
  }) async {
    if (specialize == null) {
      Alerts().showCustomToast(
          message: "يجب إختيار التخصص", color: AppColors.lightRed);
    } else if (descriptionController.text.isEmpty) {
      Alerts().showCustomToast(
          message: "يجب إدخال التفاصيل", color: AppColors.lightRed);
    } else if (hospitalId == null) {
      Alerts().showCustomToast(
          message: "يجب إختيار مستشفي", color: AppColors.lightRed);
    } else {
      emit(const RequestNewSurgeryState.loading());
      String doctorId = await _getDoctorId();
      final response = await repo.requestNewSurgery(
          body: RequestNewSurgeryRequestBody(
              description: descriptionController.text,
              hospitalId: hospitalId!,
              doctor: doctorId,
              patient: patientId,
              specialize: specialize!));
      response.when(success: (data) {
        emit(RequestNewSurgeryState.loaded(data));
      }, failure: (error) {
        emit(RequestNewSurgeryState.error(
            error.apiErrorModel.message ?? "حدث خطأ ما"));
      });
    }
  }

  clear() {
    specialize = null;
    descriptionController.clear();
    hospitalId = null;
  }
}
