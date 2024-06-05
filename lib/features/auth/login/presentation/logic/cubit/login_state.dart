import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.successDoctor() = SuccessDoctor;
  const factory LoginState.successPatient() = SuccessPatient;
  const factory LoginState.error(String message) = Error;
}
