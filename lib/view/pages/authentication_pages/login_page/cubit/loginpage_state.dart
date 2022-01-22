part of 'loginpage_cubit.dart';

abstract class LoginpageState extends Equatable {
  const LoginpageState();

  @override
  List<Object> get props => [];
}

class LoginpageDefault extends LoginpageState {}

class LoginpageLoading extends LoginpageState {}
