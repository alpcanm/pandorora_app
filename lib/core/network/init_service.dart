import 'package:dio/dio.dart';

import '../constants/service_consts.dart';

class InitService {
  final Dio _dio = Dio();

  Future<String?> getFirebaseApiKey() async {
    String uri = ServerConsts.SERVER_BASE_URL + ServerConsts.API_PATH;
    Response _response = await _dio.get(uri);
    if (_response.statusCode == 200) {
      Map _result = _response.data;
      String _data = _result['firebase-api-key'];
      return _data;
    } else {
      return null;
    }
  }
}
