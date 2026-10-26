abstract class AuthStates {}

class LoginInitial extends AuthStates {}

class LoginLoading extends AuthStates {}

class LoginSuccess extends AuthStates {}

class LoginFailure extends AuthStates {
  final String message;
  LoginFailure(this.message);
}

class SignupInitial extends AuthStates {}

class SignupLoading extends AuthStates {}

class SignupSuccess extends AuthStates {}

class SignupFailure extends AuthStates {
  final String message;
  SignupFailure(this.message);
}
