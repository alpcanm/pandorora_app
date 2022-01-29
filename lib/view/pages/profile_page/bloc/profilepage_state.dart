part of 'profilepage_bloc.dart';

abstract class ProfilepageState extends Equatable {
  const ProfilepageState({this.user});
  final User? user;
  @override
  List<Object?> get props => [user];
}

class ProfilepageInitial extends ProfilepageState {
  const ProfilepageInitial(User user) : super(user: user);
}

class ProfilepageLoading extends ProfilepageState {
  const ProfilepageLoading();
}

class ProfilepageChanged extends ProfilepageState {
  const ProfilepageChanged(User user) : super(user: user);
}

class ProfilepageError extends ProfilepageState {
  final String? errorMessage;
  const ProfilepageError({
    this.errorMessage,
  });
}
