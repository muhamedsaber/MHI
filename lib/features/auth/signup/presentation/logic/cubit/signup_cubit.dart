import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/auth/signup/data/models/signup_response_body.dart';
import 'package:mhi/features/auth/signup/data/models/sigunp_request_body.dart';
import 'package:mhi/features/auth/signup/data/repos/signup_repo.dart';
import 'package:mhi/features/auth/signup/presentation/logic/cubit/signup_state.dart';

class SignupCubit extends Cubit<SignuptStates> {
  SignupCubit({required this.repository}) : super(SignupInitial());

  TextEditingController patientUsernameController = TextEditingController();
  TextEditingController patientPasswordController = TextEditingController();
  TextEditingController patientName = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final SignupRepository repository;
  signup({required String birthday}) async {
    emit(SignupLoading());
    ApiResult<SignupResponse> resutlt = await repository.signupUser(
        signipRequestBudy: SignupRequestBody(
            username: patientUsernameController.text,
            password: patientPasswordController.text,
            name: patientName.text,
            confirmPassword: patientPasswordController.text,
            birthday: birthday));

    resutlt.when(success: (data) {
      emit(SignupSuccess(data.message ?? "تم التسجيل بنجاح"));
    }, failure: (error) {
       log(error.toString());
      emit(SignupError(error.apiErrorModel.message ?? "حدث خطأ ما"));
    });
  }
}
