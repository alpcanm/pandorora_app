import 'package:pandorora_app/core/models/product.dart';

abstract class IProductRepository {
  Future<List<Product>> get10Products();
}

class ProductRepository implements IProductRepository {
  @override
  Future<List<Product>> get10Products() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }
}
