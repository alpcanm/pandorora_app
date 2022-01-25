import 'package:dio/dio.dart';

import '../constants/service_consts.dart';
import '../models/user_model.dart';

class UserService {
  final Dio _dio = Dio();
  final BaseOptions _baseOptions =
      BaseOptions(baseUrl: ServerConsts.SERVER_BASE_URL);
  UserService() {
    _dio.options = _baseOptions;
  }

  Future<User?> readUserData({required String token}) async {
    _dio.options.headers['authorization'] = 'Bearer $token';
    Response _response = await _dio.get(ServerConsts.USERS_PATH);
    if (_response.statusCode == 200) {
      User _user = User.fromMap(_response.data);
      return _user;
    } else {
      return null;
    }
  }

  Future<bool> signUp({
    required String uid,
    required String name,
    required String surname,
    required String mail,
  }) async {
    try {
      User _data = User(
          mail: mail,
          createdAt: DateTime.now(),
          name: name,
          surname: surname,
          uid: uid);

      Response _response =
          await _dio.post(ServerConsts.USERS_PATH, data: _data.toJson());
      if (_response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
