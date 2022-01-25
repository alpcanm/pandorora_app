part of 'registerpage_cubit.dart';

abstract class RegisterpageState extends Equatable {
  const RegisterpageState();

  @override
  List<Object> get props => [];
}

class RegisterpageInitial extends RegisterpageState {}

class RegisterpageLoading extends RegisterpageState {}

class RegisterpageCompleted extends RegisterpageState {}

class RegisterpageError extends RegisterpageState {
  final String? errorMessage;
  const RegisterpageError({
    this.errorMessage,
  });
}

class RegisterpageCodePickerChanged extends RegisterpageState {
  final String countryCode;
  const RegisterpageCodePickerChanged({
    this.countryCode = '+43',
  });
  @override
  List<Object> get props => [countryCode];
}
