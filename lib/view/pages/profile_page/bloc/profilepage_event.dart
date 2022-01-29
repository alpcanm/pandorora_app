part of 'profilepage_bloc.dart';

abstract class ProfilepageEvent extends Equatable {
  const ProfilepageEvent();

  @override
  List<Object> get props => [];
}

class ProfilepageGetUpdatedUser extends ProfilepageEvent {}

class ProfilepageLogOutRequest extends ProfilepageEvent {}

class ProfilepageChangePasswordRequest extends ProfilepageEvent {}

class ProfilepageChangePhoneNumberRequest extends ProfilepageEvent {}

