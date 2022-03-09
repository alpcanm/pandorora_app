part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.products = const <Product>[],
    this.hasReachedMax = false,
  });

  final HomeStatus status;
  final List<Product> products;
  final bool hasReachedMax;

  HomeState copyWith({
    HomeStatus? status,
    List<Product>? products,
    bool? hasReachedMax,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, posts: ${products.length} }''';
  }

  @override
  List<Object> get props => [status, products, hasReachedMax];
}


