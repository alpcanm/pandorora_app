part of 'homepage_cubit.dart';

abstract class HomepageState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomepageInitial extends HomepageState {}

class HomepageLoading extends HomepageState {}

class HomepagePaginationLoading extends HomepageState {}

class HomepageCompleted extends HomepageState {}

class HomepageError extends HomepageState {}
