part of 'auth_bloc.dart';// auth_bloc.dart 'ın bir parçası demektir. Aynısından auth_state te var.

abstract class AuthEvent {
  const AuthEvent();
}

class AuthLogoutRequested extends AuthEvent {}

class AuthTryGetCurrentUser extends AuthEvent {}

class AuthLoginRequested extends AuthEvent {// Login isteği atarken içeriye mail ve password almamız gerekiyor.
  const AuthLoginRequested(this.mail, this.password);
  final String mail;
  final String password;
}
