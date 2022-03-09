import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/models/product.dart';
import '../../console_page/console_body.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeFetched>(_onProductFetched);
    // on<HomeSearched>(_onSearched);
    add(HomeFetched());
  }

  // Future<void> _onSearched(HomeSearched event, Emitter<HomeState> emit) async {}

  Future<void> _onProductFetched(
      HomeFetched event, Emitter<HomeState> emit) async {
    if (state.hasReachedMax) return;
    if (state.status == HomeStatus.initial) {
      final _products = await _fetchProducts();
      if (_products!.isNotEmpty) {
        return emit(
          state.copyWith(
            hasReachedMax: false,
            products: _products,
            status: HomeStatus.success,
          ),
        );
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
    final _product = Product(
        comment: "Açıklama",
        drawDate: DateTime(2022, 2, 28),
        isExpired: false,
        photoURL: imageURL,
        productId: "516516546514",
        title: "Razer Mouse",
        tag: "#Mutfak malzemesi",
        drawURL: "asd");
    List<Product> _listPRoduct = [
      _product,
      _product,
      _product,
      _product,
      _product,
      _product,
    ];
    return _listPRoduct;
  }
}
