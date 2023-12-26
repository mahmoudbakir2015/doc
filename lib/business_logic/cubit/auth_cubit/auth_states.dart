import '../../../data/model/auth_model.dart';

abstract class AuthStates {}

class InitialAuthState extends AuthStates {}

class InitialRegister extends AuthStates {}

class RegisterSuccessed extends AuthStates {
  final AuthModel authModel;

  RegisterSuccessed({required this.authModel});
}

class RegisterFailed extends AuthStates {
  final String errorMessage;

  RegisterFailed({required this.errorMessage});
}

class InitialLogin extends AuthStates {}

class LoginSuccessed extends AuthStates {
  final AuthModel authModel;

  LoginSuccessed({required this.authModel});
}

class LoginFailed extends AuthStates {
  final String errorMessage;

  LoginFailed({required this.errorMessage});
}

class LogoutSuccessed extends AuthStates {}
