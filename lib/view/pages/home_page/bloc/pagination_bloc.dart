import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../../../core/models/product.dart';
import '../../../../core/utils/locator_get_it.dart';
import '../../../../feature/repositories/product_repository.dart';

part 'pagination_event.dart';
part 'pagination_state.dart';

const throttleDuration = Duration(seconds: 1);
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PaginationBloc extends Bloc<PaginationEvent, PaginationState> {
  PaginationBloc() : super(const PaginationState()) {
    on<PaginationAllFetched>(
      _onProductFetched,
      transformer: throttleDroppable<PaginationAllFetched>(throttleDuration),
    );
    on<PaginationFilteredPatch>(
      _onFilteredSearch,
      transformer: throttleDroppable<PaginationFilteredPatch>(throttleDuration),
    );
    add(PaginationAllFetched());
  }

  Future<void> _onFilteredSearch(
      PaginationFilteredPatch event, Emitter<PaginationState> emit) async {
    if (state.hasReachedMax) return;
    if (state.status == PaginationStatus.initial) {
      final _products = await _fetchProducts(
          DateTime.now().millisecondsSinceEpoch,
          filters: event.filters);
      if (_products!.isNotEmpty) {
        return emit(
          state.copyWith(
              hasReachedMax: false,
              products: _products,
              status: PaginationStatus.success,
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
            status: PaginationStatus.success,
            hasReachedMax: false,
            products: List.of(state.products)..addAll(_prodcuts),
            lastDrawTime: _prodcuts.last.drawDate,
            isFiltered: true),
      );
    }
  }

  Future<void> _onProductFetched(
      PaginationAllFetched event, Emitter<PaginationState> emit) async {
    if (state.hasReachedMax) return;
    if (state.status == PaginationStatus.initial) {
      final _products = await _fetchProducts(5);
      if (_products!.isNotEmpty) {
        return emit(
          state.copyWith(
            hasReachedMax: false,
            products: _products,
            status: PaginationStatus.success,
            lastDrawTime: _products.last.drawDate,
          ),
        );
      }
    }
    final List<Product>? _prodcuts = await _fetchProducts(state.lastDrawTime);
    if (_prodcuts == null || _prodcuts.isEmpty) {
      emit(state.copyWith(hasReachedMax: true));
    } else {
      emit(
        state.copyWith(
            status: PaginationStatus.success,
            hasReachedMax: false,
            products: List.of(state.products)..addAll(_prodcuts),
            lastDrawTime: _prodcuts.last.drawDate),
      );
    }
  }

  Future<List<Product>?>? _fetchProducts(int startAtLastDrawTime,
      {List<String>? filters}) async {
    return await getIt<ProductRepository>()
        .getProducts(startAtLastDrawTime, filters: filters);
  }
}
