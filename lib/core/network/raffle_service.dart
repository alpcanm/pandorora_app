import 'package:dio/dio.dart';
import 'dart:io' show Platform;
import '../constants/service_consts.dart';
import '../models/subscriber_model.dart';

class RaffleService {
  final Dio _dio = Dio();
  BaseOptions _baseOptions = BaseOptions(baseUrl: ServerConsts.ANDROID_URL);
  RaffleService() {
    String _baseUrl = Platform.isAndroid ? ServerConsts.ANDROID_URL : ServerConsts.IOS_URL;
    _baseOptions = BaseOptions(baseUrl: _baseUrl);
    _dio.options = _baseOptions;
  }

  Future<dynamic> getRaffles(int startIndex, {Set<String>? filters}) async {
    //filtreyi replace ediyoruz.
    final String _query = _replaceFilter(filters);
    // queryParameters a parametrelerimizi atıyoruz. ve isteğimizi gönderiyoruz.
    Response _response = await _dio.get(ServerConsts.RAFFLE_PATH, queryParameters: {"gt": startIndex, "tags": _query});
    //Gelence cevap 200 status code ise response modelimize göre içindeki datayı çekiyoruz.
    if (_response.statusCode == 200) {
      return _response.data["body"]["data"];
    }
    return null;
  }

  String _replaceFilter(Set<String>? filters) {
    if (filters == null) {
      return "";
    }
    String primarySplit = filters.toString().replaceAll(" ", "");
    String secondarySplit = primarySplit.toString().replaceAll("{", "");
    String query = secondarySplit.toString().replaceAll("}", "");
    return query;
  }

  Future<dynamic> myRaffles(String? userId) async {
    Response _response = await _dio.get(ServerConsts.USERS_PATH + '/$userId/subscribed-raffles?gt=0');
    if (_response.statusCode == 200) {
      return _response.data["body"]["data"];
    } else {
      return null;
    }
  }

  Future<bool> subscribeARaffle({required String raffleId, required String userId, required String raffleNickName, required int date}) async {
    SubscriberModel _data = SubscriberModel(subscribeDate: date, subscriberId: userId, raffleNickName: raffleNickName);
    Response _response = await _dio.post(ServerConsts.RAFFLE_PATH_ADDTO + '?rfid=$raffleId&uid=$userId', data: _data.toJson());
    if (_response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
