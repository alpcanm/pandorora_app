import 'package:pandorora_app/core/models/product.dart';

abstract class IProductRepository {
  Future<List<Product>> tryGet10Products(bool pagination);
}

class ProductRepository implements IProductRepository {
  @override
  Future<List<Product>> tryGet10Products(bool pagination) {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }
}
