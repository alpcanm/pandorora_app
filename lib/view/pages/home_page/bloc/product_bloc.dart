import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pandorora_app/core/models/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductState()) {
    on<ProductFetched>(_onProductFetched);
  }

  Future<void> _onProductFetched(
      ProductFetched event, Emitter<ProductState> emit) async {
    if (state.hasReachedMax) return;

    if (state.status == ProductStatus.initial) {
      final _products = await _fetchProducts();
      if (_products!.isNotEmpty) {
        return emit(state.copyWith(
          hasReachedMax: false,
          products: _products,
          status: ProductStatus.success,
        ));
      }
    }
    final _prodcuts = await _fetchProducts(state.products.length);
    if (_prodcuts!.isEmpty) {
      emit(state.copyWith(hasReachedMax: true));
    } else {
      emit(state.copyWith(
          status: ProductStatus.success,
          hasReachedMax: false,
          products: List.of(state.products)..addAll(_prodcuts)));
    }
  }

  Future<List<Product>?> _fetchProducts([int startIndex = 0]) async {}
}
