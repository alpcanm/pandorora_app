part of 'changepassword_bloc.dart';

abstract class ChangepasswordEvent extends Equatable {
  const ChangepasswordEvent();

  @override
  List<Object> get props => [];
}

class ChangepasswordConfirmCurrentPasswordRequest extends ChangepasswordEvent {}

class ChangepasswordChangeNewPasswordRequest extends ChangepasswordEvent {}
