import 'package:pandorora_app/core/network/product_service.dart';

import '../../core/models/product.dart';

abstract class IProductRepository {
  Future<List<Product>?> getProducts(int startIndex, {List<String>? filters});
  Future<List<Product>> myFutureProducts(String userId);
  Future<List<Product>> myPastProducts(String userId);
}

class ProductRepository implements IProductRepository {
  final ProductService _productService = ProductService();

  @override
  Future<List<Product>?> getProducts(int startIndex,
      {List<String>? filters}) async {
    if (filters != null) {
      return _getFilteredProducts(startIndex, filters);
    }
    return _getAllProducts(startIndex);
  }

  Future<List<Product>?> _getFilteredProducts(
      int startIndex, List<String> filters) async {
    List<Product> _result = [];

    if (filters.isNotEmpty) {
      List? _response =
          await _productService.getFilteredProducts(startIndex, filters);
      if (_response != null) {
        for (var element in _response) {
          _result.add(Product.fromMap(element));
        }
        return _result;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<List<Product>?> _getAllProducts(int startIndex) async {
    List<Product> _result = [];

    List? _response = await _productService.getAllProducts(startIndex);
    if (_response != null) {
      for (var element in _response) {
        _result.add(Product.fromMap(element));
      }
      return _result;
    } else {
      return null;
    }
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
