import 'package:dio/dio.dart';

import '../constants/service_consts.dart';
import '../models/user_model.dart';

abstract class IUserService {
  Future<User?> readUserData({required String token});
  Future<bool> signUp(
      {required String uid,
      required String name,
      required String mail,
      required String raffleNickName});

  Future<bool> updateUserData({
    required String uid,
    String? name,
    String? raffleNickName,
  });
}

class UserService implements IUserService {
  final Dio _dio = Dio();
  final BaseOptions _baseOptions =
      BaseOptions(baseUrl: ServerConsts.SERVER_BASE_URL);
  UserService() {
    _dio.options = _baseOptions;
  }
  @override
  Future<User?> readUserData({required String token}) async {
    _dio.options.headers['authorization'] = 'Bearer $token';
    Response _response = await _dio.get(ServerConsts.USERS_PATH);
    if (_response.statusCode == 200) {
      User _user = User.fromMap((_response.data as Map)['body']['data']);
      return _user;
    } else {
      return null;
    }
  }

  @override
  Future<bool> signUp(
      {required String uid,
      required String name,
      required String mail,
      required String raffleNickName}) async {
    try {
      User _data = User(
          name: name, mail: mail, uid: uid, raffleNickName: raffleNickName);
      Response _response =
          await _dio.post(ServerConsts.USERS_PATH, data: _data.toJson());
      if (_response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> updateUserData(
      {required String? uid, String? name, String? raffleNickName}) async {
    Map _data = {"raffle_nick_name": raffleNickName, "name": name};
    Response _response =
        await _dio.post(ServerConsts.USERS_PATH + "/$uid", data: _data);
    if (_response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
