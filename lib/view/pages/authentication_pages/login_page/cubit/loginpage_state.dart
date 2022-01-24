part of 'loginpage_cubit.dart';

abstract class LoginpageState extends Equatable {
  const LoginpageState();

  @override
  List<Object> get props => [];
}

class LoginpageInitial extends LoginpageState {}

class LoginpageLoading extends LoginpageState {}

class LoginpageCompleted extends LoginpageState {}

class LoginpageError extends LoginpageState {
  final String? errorMessage;
  const LoginpageError({
    this.errorMessage,
  });
}
