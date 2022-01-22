part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthTryGetCurrentUser extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class AuthStatusChanged extends AuthEvent {
  const AuthStatusChanged(this.status);
  final AuthStatus status;

  @override
  List<Object> get props => [status];
}
