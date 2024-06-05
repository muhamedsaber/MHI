import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/auth/login/data/domain/user_entity.dart';
import 'package:mhi/features/auth/login/data/models/login_request_body.dart';
import 'package:mhi/features/auth/login/data/repos/login_repository.dart';
import 'package:mhi/features/auth/login/presentation/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.repository}) : super(const LoginState.initial());
  final TextEditingController patientUsernameController =
      TextEditingController();
  final TextEditingController patientPasswordController =
      TextEditingController();
  final TextEditingController doctorUsernameController =
      TextEditingController();
  final TextEditingController doctorPasswordController =
      TextEditingController();
  final LoginRepository repository;

  // I seperated the loginPatient and loginDoctor methods to make the code more readable and maintainable
  loginPatient() async {
    ApiResult<UserEntity> result = await repository.loginUser(
        loginRequestBody: LoginRequestBody(
            username: patientUsernameController.text,
            password: patientPasswordController.text));
    result.when(success: (data) {
      if (data.role == "patient") {
        emit(const LoginState.successPatient());
      } else if (data.role == "doctor") {
        emit(const LoginState.error("غير مسموح للأطباء بتسجيل الدخول هنا"));
      }
    }, failure: (error) {
      emit(LoginState.error(error.apiErrorModel.message ?? "حدث خطأ ما"));
    });
  }

  loginDoctor() async {
    ApiResult<UserEntity> result = await repository.loginUser(
        loginRequestBody: LoginRequestBody(
            username: doctorUsernameController.text,
            password: doctorUsernameController.text));
    result.when(success: (data) {
      if (data.role == "doctor") {
        emit(const LoginState.successDoctor());
      } else if (data.role == "patient") {
        emit(const LoginState.error("غير مسموح للمرضى بتسجيل الدخول هنا"));
      }
    }, failure: (error) {
      emit(LoginState.error(error.apiErrorModel.message ?? "حدث خطأ ما"));
    });
  }
}
