part of 'updateprofile_cubit.dart';

abstract class UpdateprofileState extends Equatable {
  const UpdateprofileState();

  @override
  List<Object> get props => [];
}

class UpdateprofileInitial extends UpdateprofileState {}

class UpdateprofileLoading extends UpdateprofileState {}

class UpdateprofileCompleted extends UpdateprofileState {}

class UpdateprofileError extends UpdateprofileState {
  final String? errorMessage;
  const UpdateprofileError({
    this.errorMessage,
  });
}

class UpdateprofileButtonActive extends UpdateprofileState {}

class UpdateprofileButtonPassive extends UpdateprofileState {}
