sealed class SignuptStates {}
class SignupSuccess extends SignuptStates {
  final String message;
  SignupSuccess(this.message);
}
class SignupError extends SignuptStates {
  final String message;
  SignupError(this.message);
}
class SignupLoading extends SignuptStates {}
class SignupInitial extends SignuptStates {}
