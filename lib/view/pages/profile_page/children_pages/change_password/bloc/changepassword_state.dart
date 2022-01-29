part of 'changepassword_bloc.dart';

abstract class ChangepasswordState extends Equatable {
  const ChangepasswordState();

  @override
  List<Object> get props => [];
}

class ChangepasswordInitial extends ChangepasswordState {}

class ChangepasswordLoading extends ChangepasswordState {}

class ChangepasswordCurrentPasswordVerified extends ChangepasswordState {}

class ChangepasswordNewPasswordVerified extends ChangepasswordState {}

class ChangepasswordError extends ChangepasswordState {}
