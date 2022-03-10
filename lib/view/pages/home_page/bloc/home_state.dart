part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.products = const <Product>[],
    this.hasReachedMax = false,
    this.lastDrawTime = 0,
    this.isFiltered = false,
  });

  final HomeStatus status;
  final List<Product> products;
  final bool hasReachedMax;
  final int lastDrawTime;
  final bool isFiltered;
  HomeState copyWith({
    HomeStatus? status,
    List<Product>? products,
    bool? hasReachedMax,
    bool? isFiltered,
    int? lastDrawTime,
  }) {
    return HomeState(
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
