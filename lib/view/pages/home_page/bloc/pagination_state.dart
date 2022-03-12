part of 'pagination_bloc.dart';

enum PaginationStatus { initial, loading, success, failure ,completed}

class PaginationState extends Equatable {
  const PaginationState({
    this.status = PaginationStatus.initial,
    this.raffles = const <Raffle>[],
    this.hasReachedMax = false,
    this.lastRaffleTime = 0,
    this.isFiltered = false,
  });

  final PaginationStatus status;
  final List<Raffle> raffles;
  final bool hasReachedMax;
  final int lastRaffleTime;
  final bool isFiltered;
  PaginationState copyWith({
    PaginationStatus? status,
    List<Raffle>? raffles,
    bool? hasReachedMax,
    bool? isFiltered,
    int? lastRaffleTime,
  }) {
    return PaginationState(
      status: status ?? this.status,
      raffles: raffles ?? this.raffles,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      lastRaffleTime: lastRaffleTime ?? this.lastRaffleTime,
      isFiltered: isFiltered ?? this.isFiltered,
    );
  }

  @override
  List<Object> get props =>
      [status, raffles, hasReachedMax, lastRaffleTime, isFiltered];
}
