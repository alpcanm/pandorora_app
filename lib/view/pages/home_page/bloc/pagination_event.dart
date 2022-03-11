part of 'pagination_bloc.dart';

abstract class PaginationEvent extends Equatable {
  const PaginationEvent();

  @override
  List<Object> get props => [];
}

class PaginationAllFetched extends PaginationEvent {}

class PaginationSwtiched extends PaginationEvent {}

class PaginationFilteredPatch extends PaginationEvent {
  final List<String> filters;

  const PaginationFilteredPatch(this.filters);
}
