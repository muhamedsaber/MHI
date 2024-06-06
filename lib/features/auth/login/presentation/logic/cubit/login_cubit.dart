import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhi/config/database/cache/user_cache.dart';
import 'package:mhi/core/networking/api_result.dart';
import 'package:mhi/features/auth/login/data/domain/user_entity.dart';
import 'package:mhi/features/auth/login/data/models/doctor_model.dart';
import 'package:mhi/features/auth/login/data/models/login_request_body.dart';
import 'package:mhi/features/auth/login/data/models/patient_model.dart';
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

  loginPatient() async {
    emit(const LoginState.loading());
    ApiResult<UserEntity> result = await repository.loginUser(
        loginRequestBody: LoginRequestBody(
            username: patientUsernameController.text,
            password: patientPasswordController.text));
    result.when(success: (data) {
      if (data.role == "patient") {
        _saveUserToCache(data);
        emit(const LoginState.successPatient());
      } else if (data.role == "doctor") {
        emit(const LoginState.error("غير مسموح للأطباء بتسجيل الدخول هنا"));
      }
    }, failure: (error) {
      emit(LoginState.error(error.apiErrorModel.message ?? "حدث خطأ ما"));
    });
  }

  loginDoctor() async {
    emit(const LoginState.loading());
    ApiResult<UserEntity> result = await repository.loginUser(
        loginRequestBody: LoginRequestBody(
            username: doctorUsernameController.text,
            password: doctorUsernameController.text));
    result.when(success: (data) {
      if (data.role == "doctor") {
        _saveUserToCache(data);
        emit(const LoginState.successDoctor());
      } else if (data.role == "patient") {
        emit(const LoginState.error("غير مسموح للمرضى بتسجيل الدخول من هنا"));
      }
    }, failure: (error) {
      emit(LoginState.error(error.apiErrorModel.message ?? "حدث خطأ ما"));
    });
  }

  ///saving [data] which is eaither a doctorModel or PatientModel
  ///to the [cache]
  _saveUserToCache(UserEntity data) async {
    UserCache<PatientModel> patientCache = PatientCache();
    UserCache<DoctorModel> doctorCache = DoctorCache();

    if (data is PatientModel) {
      await patientCache.saveUser(user: data);
    } else if (data is DoctorModel) {
      await doctorCache.saveUser(user: data);
    }
  }
}
