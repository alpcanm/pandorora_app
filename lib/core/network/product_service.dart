import 'package:pandorora_app/core/models/product.dart';

class ProductService {
  Future<List<Product>> homeProducts(bool pagination, {Map? filters}) {
    throw UnimplementedError();
  }

  Future<List<Product>> myFutureProducts(bool pagination, String userId) {
    throw UnimplementedError();
  }

  Future<List<Product>> myPastProducts(bool pagination, String userId) {
    throw UnimplementedError();
  }
}
