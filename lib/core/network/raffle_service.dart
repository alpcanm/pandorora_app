import 'package:dio/dio.dart';

import '../constants/service_consts.dart';
import '../models/raffle.dart';

class RaffleService {
  final Dio _dio = Dio();
  final BaseOptions _baseOptions =
      BaseOptions(baseUrl: ServerConsts.SERVER_BASE_URL);
  RaffleService() {
    _dio.options = _baseOptions;
  }

  Future<List?> getAllRaffles(int startIndex) async {
    Response _response = await _dio.get(ServerConsts.RAFFLE_PATH,
        queryParameters: {"gt": startIndex.toString()});
    if (_response.statusCode == 200) {
      return _response.data["body"]["data"];
    } else {
      return null;
    }
  }

  Future<List?> getFilteredRaffles(int startIndex, Set<String> filters) async {
    String tagQuery1 = filters.toString().replaceAll(" ", "");
    String tagQuery2 = tagQuery1.toString().replaceAll("{", "");
    String tagQuery3 = tagQuery2.toString().replaceAll("}", "");

    Response _response = await _dio
        .get(ServerConsts.RAFFLE_PATH + '?gt=$startIndex&tags=$tagQuery3');
    if (_response.statusCode == 200) {
      return _response.data["body"]["data"];
    } else {
      return null;
    }
  }

  Future<dynamic> myRaffles(String userId) async {
    Response _response =
        await _dio.get(ServerConsts.USERS_PATH + '/$userId?gt=0');
    if (_response.statusCode == 200) {
      return _response.data["body"]["data"];
    } else {
      return null;
    }
  }
}
