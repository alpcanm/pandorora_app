part of 'pagination_bloc.dart';

abstract class PaginationEvent extends Equatable {
  const PaginationEvent();

  @override
  List<Object> get props => [];
}

class PaginationAllFetched extends PaginationEvent {
  final PaginationStatus? status;

  const PaginationAllFetched({this.status});
}

class PaginationFilteredPatch extends PaginationEvent {
  final Set<String> filters;
  final PaginationStatus? status;

  const PaginationFilteredPatch(this.filters,{this.status});
}
