part of 'pagination_bloc.dart';

abstract class PaginationEvent extends Equatable {
  const PaginationEvent();

  @override
  List<Object> get props => [];
}

class PaginationAllFetched extends PaginationEvent {
  final PaginationStatus? status;
 final Set<String>? filters;
  const PaginationAllFetched({
    this.status,
     this.filters,
  });
}

