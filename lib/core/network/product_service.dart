import 'package:dio/dio.dart';

import '../constants/service_consts.dart';
import '../models/product.dart';

class ProductService {
  final Dio _dio = Dio();
  final BaseOptions _baseOptions =
      BaseOptions(baseUrl: ServerConsts.SERVER_BASE_URL);
  ProductService() {
    _dio.options = _baseOptions;
  }

  Future<List?> getAllProducts(int startIndex) async {
    Response _response = await _dio.get(ServerConsts.PRODUCTS_PATH, queryParameters: {"gt": "10"});
    if (_response.statusCode == 200) {
      return _response.data["body"]["data"] as List;
    } else {
      return null;
    }
  }

  Future<List<Product>>? getFilteredProducts(
      int startIndex, List<String> filters) {}

  Future<List<Product>> myFutureProducts(bool pagination, String userId) {
    throw UnimplementedError();
  }

  Future<List<Product>> myPastProducts(bool pagination, String userId) {
    throw UnimplementedError();
  }
}
