part of 'pagination_bloc.dart';

enum PaginationStatus { initial, success, failure, completed }

class PaginationState extends Equatable {
  const PaginationState({
    this.status = PaginationStatus.initial,
    this.raffles = const <Raffle>[],
    this.hasReachedMax = false,
    this.lastRaffleTime = 0,
  });

  final PaginationStatus status;
  final List<Raffle> raffles;
  final bool hasReachedMax;
  final int lastRaffleTime;

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
    );
  }

  @override
  List<Object> get props => [status, raffles, hasReachedMax, lastRaffleTime];
}
