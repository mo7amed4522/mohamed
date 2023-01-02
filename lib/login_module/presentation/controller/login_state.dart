part of 'login_cubit.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitialState extends LoginState {}

class PasswordVisibilityState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {}

class LoginSuccessState extends LoginState {}
