part of 'product_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeFetched extends HomeEvent {}

class HomeSearched extends HomeEvent {}
