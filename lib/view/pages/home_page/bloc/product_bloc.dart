import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:pandorora_app/core/models/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeFetched>(_onProductFetched);
  }

  Future<void> _onProductFetched(
      HomeFetched event, Emitter<HomeState> emit) async {
    if (state.hasReachedMax) return;

    if (state.status == HomeStatus.initial) {
      final _products = await _fetchProducts();
      if (_products!.isNotEmpty) {
        return emit(state.copyWith(
          hasReachedMax: false,
          products: _products,
          status: HomeStatus.success,
        ));
      }
    }
    final _prodcuts = await _fetchProducts(state.products.length);
    if (_prodcuts!.isEmpty) {
      emit(state.copyWith(hasReachedMax: true));
    } else {
      emit(state.copyWith(
          status: HomeStatus.success,
          hasReachedMax: false,
          products: List.of(state.products)..addAll(_prodcuts)));
    }
  }

  Future<List<Product>?> _fetchProducts([int startIndex = 0]) async {
    Dio().get("https://jsonplaceholder.typicode.com/posts");
  }
}
