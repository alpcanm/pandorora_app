import 'package:pandorora_app/core/models/product.dart';

abstract class IProductRepository {
  Future<List<Product>> homeProducts(String userId);

  Future<List<Product>> myFutureProducts(String userId);
  Future<List<Product>> myPastProducts(String userId);
}

class ProductRepository implements IProductRepository {
  @override
  Future<List<Product>> homeProducts(String userId) {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> myFutureProducts(String userId) {
    // TODO: implement myFutureProducts
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> myPastProducts(String userId) {
    // TODO: implement myPastProducts
    throw UnimplementedError();
  }
}