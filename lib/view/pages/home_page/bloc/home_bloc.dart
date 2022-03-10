import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../../../core/models/product.dart';
import '../../../../core/utils/locator_get_it.dart';
import '../../../../feature/repositories/product_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

const throttleDuration = Duration(seconds: 1);
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeFetched>(
      _onProductFetched,
      transformer: throttleDroppable<HomeFetched>(throttleDuration),
    );
    on<HomeFilteredFetched>(
      _onFilteredSearch,
      transformer: throttleDroppable<HomeFilteredFetched>(throttleDuration),
    );
    add(HomeFetched());
  }

  Future<void> _onFilteredSearch(
      HomeFilteredFetched event, Emitter<HomeState> emit) async {
    if (state.hasReachedMax) return;
    if (state.status == HomeStatus.initial) {
      final _products = await _fetchProducts(
          DateTime.now().millisecondsSinceEpoch,
          filters: event.filters);
      if (_products!.isNotEmpty) {
        return emit(
          state.copyWith(
              hasReachedMax: false,
              products: _products,
              status: HomeStatus.success,
              lastDrawTime: _products.last.drawDate,
              isFiltered: true),
        );
      }
    }
    final _prodcuts =
        await _fetchProducts(state.lastDrawTime, filters: event.filters);
    if (_prodcuts!.isEmpty) {
      emit(state.copyWith(hasReachedMax: true));
    } else {
      emit(
        state.copyWith(
            status: HomeStatus.success,
            hasReachedMax: false,
            products: List.of(state.products)..addAll(_prodcuts),
            lastDrawTime: _prodcuts.last.drawDate,
            isFiltered: true),
      );
    }
  }

  Future<void> _onProductFetched(
      HomeFetched event, Emitter<HomeState> emit) async {
    print("debug1");
    if (state.hasReachedMax) return;
    if (state.status == HomeStatus.initial) {
      print("debug2");

      final _products =
          await _fetchProducts(DateTime.now().millisecondsSinceEpoch);
      if (_products!.isNotEmpty) {
        print("debug5");

        return emit(
          state.copyWith(
            hasReachedMax: false,
            products: _products,
            status: HomeStatus.success,
            lastDrawTime: _products.last.drawDate,
          ),
        );
      }
    }
    final _prodcuts = await _fetchProducts(state.lastDrawTime);
    if (_prodcuts!.isEmpty) {
      print("debug3");

      emit(state.copyWith(hasReachedMax: true));
    } else {
      print("debug4");

      emit(
        state.copyWith(
            status: HomeStatus.success,
            hasReachedMax: false,
            products: List.of(state.products)..addAll(_prodcuts),
            lastDrawTime: _prodcuts.last.drawDate),
      );
    }
  }

  Future<List<Product>?>? _fetchProducts(int startAtLastDrawTime,
      {List<String>? filters}) async {
    print("FETCH");

    return await getIt<ProductRepository>()
        .getProducts(startAtLastDrawTime, filters: filters);
  }
}
