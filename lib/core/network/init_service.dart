import 'package:dio/dio.dart';
import 'dart:io' show Platform;
import '../constants/service_consts.dart';

class InitService {
  final Dio _dio = Dio();

  Future<String?> getFirebaseApiKey() async {
    String _baseUrl =
        Platform.isAndroid ? ServerConsts.ANDROID_URL : ServerConsts.IOS_URL;

    String uri = _baseUrl + ServerConsts.API_PATH;
    Response _response = await _dio.get(uri);

    if (_response.statusCode == 200) {
      Map _result = _response.data;
      String _data = _result['body']['data'];

      return _data;
    } else {
      return null;
    }
  }
}
