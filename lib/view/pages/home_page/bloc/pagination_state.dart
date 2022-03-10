part of 'pagination_bloc.dart';

enum PaginationStatus { initial, loading, success, failure }

class PaginationState extends Equatable {
  const PaginationState({
    this.status = PaginationStatus.initial,
    this.products = const <Product>[],
    this.hasReachedMax = false,
    this.lastDrawTime = 0,
    this.isFiltered = false,
  });

  final PaginationStatus status;
  final List<Product> products;
  final bool hasReachedMax;
  final int lastDrawTime;
  final bool isFiltered;
  PaginationState copyWith({
    PaginationStatus? status,
    List<Product>? products,
    bool? hasReachedMax,
    bool? isFiltered,
    int? lastDrawTime,
  }) {
    return PaginationState(
      status: status ?? this.status,
      products: products ?? this.products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      lastDrawTime: lastDrawTime ?? this.lastDrawTime,
      isFiltered: isFiltered ?? this.isFiltered,
    );
  }

  @override
  List<Object> get props =>
      [status, products, hasReachedMax, lastDrawTime, isFiltered];
}
