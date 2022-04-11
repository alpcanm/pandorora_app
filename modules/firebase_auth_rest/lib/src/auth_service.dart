import 'package:dio/dio.dart';
import 'firebase_uri.dart';

class AuthService {
  final String firebaseApiKey;
  late FirebaseURI _restURI;
  late Dio _dio;
  late BaseOptions _baseOptions;
  AuthService(this.firebaseApiKey) {
    _restURI = FirebaseURI(firebaseApiKey);
    _dio = Dio();
    _baseOptions = BaseOptions(baseUrl: _restURI.baseUri);
    _dio.options = _baseOptions;
  }

  Future<dynamic> signInWithPassword(
      {required String mail, required String password}) async {
    try {
      Map _data = {
        "email": mail,
        "password": password,
        "returnSecureToken": true
      };
      Response _response = await _dio.post(_restURI.signInUri, data: _data);
      if (_response.statusCode == 200) {
        return _response.data;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> checkUserMailVerified(String idToken) async {
    try {
      Map _data = {
        "idToken": idToken,
      };
      Response _response = await _dio.post(_restURI.getUserData, data: _data);

      if (_response.statusCode == 200) {
        // response içerisindeki veri true mu değil mi kontrol ediyor.
        if (_response.data["users"][0]["emailVerified"] == true) return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  Future<bool> changePassword(
      {required String idToken, required String newPassword}) async {
    try {
      Map _data = {
        "idToken": idToken,
        "password": newPassword,
        "returnSecureToken": true
      };
      Response _response =
          await _dio.post(_restURI.changePassword, data: _data);
      if (_response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> _sendVerificationMail(String idtoken) async {
    // Doğrulama maili gönderir.
    Map _mailVerifyData = {"requestType": "VERIFY_EMAIL", "idToken": idtoken};
    Response _mailVerifyResponse =
        await _dio.post(_restURI.mailSender, data: _mailVerifyData);
    if (_mailVerifyResponse.statusCode == 200) return true;
    return false;
  }

  Future<bool> sendResetPasswordMail(String mail) async {
    // Doğrulama maili gönderir.
    try {
      Map _resetPasswordData = {"requestType": "PASSWORD_RESET", "email": mail};
      Response _resetPasswordResponnse =
          await _dio.post(_restURI.mailSender, data: _resetPasswordData);
      if (_resetPasswordResponnse.statusCode == 200) return true;
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<String?> signUpAndGetUid(
      {required String mail, required String password}) async {
    try {
      Map _data = {
        "email": mail,
        "password": password,
        "returnSecureToken": true
      };
      Response _signUpResponse =
          await _dio.post(_restURI.signUpUri, data: _data);
      if (_signUpResponse.statusCode == 200) {
        if (await _sendVerificationMail(
            _signUpResponse.data['idToken'] as String)) {
          return _signUpResponse.data['localId'];
        }
        return null;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
