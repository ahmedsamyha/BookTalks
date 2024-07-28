abstract class AuthState {}

class AuthInitialState extends AuthState {}

class LoginInitialState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginFailureState extends AuthState {
  final String errorMessage;

  LoginFailureState({required this.errorMessage});
}

class RegisterInitialState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterFailureState extends AuthState {
  final String errorMessage;

  RegisterFailureState({required this.errorMessage});
}

class SignOutInitialState extends AuthState {}

class SignOutLoadingState extends AuthState {}

class SignOutSuccessState extends AuthState {}

class SignOutFailureState extends AuthState {
  final String errorMessage;

  SignOutFailureState({required this.errorMessage});
}

class ResetPasswordInitialState extends AuthState {}

class ResetPasswordLoadingState extends AuthState {}

class ResetPasswordSuccessState extends AuthState {}

class ResetPasswordFailureState extends AuthState {
  final String errorMessage;

  ResetPasswordFailureState({required this.errorMessage});
}


class GoogleSignInInitialState extends AuthState {}

class GoogleSignInLoadingState extends AuthState {}

class GoogleSignInSuccessState extends AuthState {}

class GoogleSignInFailureState extends AuthState {
  final String errorMessage;

  GoogleSignInFailureState({required this.errorMessage});
}
