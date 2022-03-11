import 'package:dio/dio.dart';

import '../constants/service_consts.dart';
import '../models/user_model.dart';

abstract class IUserService {
  Future<User?> readUserData({required String token});
  Future<bool> signUp({
    required String uid,
    required String name,
    required String surname,
    required String mail,
    required String phoneNumber,
  });
  Future<bool> updateMail({
    required String uid,
    required String mail,
  });
  Future<bool> updateUserData({
    required String uid,
    String? name,
    String? surname,
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
    
      User _user = User.fromMap((_response.data as Map)['body']['data'] );
      return _user;
    } else {
      return null;
    }
  }

  @override
  Future<bool> signUp({
    required String uid,
    required String name,
    required String surname,
    required String mail,
    required String phoneNumber
  }) async {
    try {
      User _data = User(name: name, surname: surname, mail: mail, uid: uid,phoneNumber:phoneNumber);
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
  Future<bool> updateMail({required String uid, required String mail}) {
    // TODO: implement updateMail
    throw UnimplementedError();
  }

  @override
  Future<bool> updateUserData(
      {required String uid,
      String? name,
      String? surname,
      String? raffleNickName}) {
    // TODO: implement updateUserData
    throw UnimplementedError();
  }
}
