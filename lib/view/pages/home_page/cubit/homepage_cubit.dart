import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pandorora_app/core/models/product.dart';
import 'package:pandorora_app/core/utils/locator_get_it.dart';
import 'package:pandorora_app/feature/repositories/product_repository.dart';

part 'homepage_state.dart';

class HomepageCubit extends Cubit<HomepageState> {
  final _productRepository = getIt<ProductRepository>();
  HomepageCubit() : super(HomepageInitial()) {
    _get10Products();
  }

  List<Product> _productList = [];

  List<Product> get productList => _productList;
  Future _get10Products() async {
    emit(HomepageLoading());
    _productList = await _productRepository.get10Products();
    if (_productList.isNotEmpty) {
      emit(HomepageCompleted());
    } else {
      emit(HomepageError());
    }
  }
}
