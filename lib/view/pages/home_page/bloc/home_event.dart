part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeFetched extends HomeEvent {}

class HomeFilteredFetched extends HomeEvent {
  final List<String> filters;

  const HomeFilteredFetched(this.filters);
}
