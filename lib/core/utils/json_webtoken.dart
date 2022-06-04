import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class JwtManager {
  final dynamic _data;
  late JWT _jwt;
  JwtManager(this._data) {
    _jwt = JWT(_data);
  }

  String signJwt() {
    int _expiredTime = 1500;
    String _secretKey = dotenv.env['JWT_SECRET_KEY'] as String;
    String token = _jwt.sign(SecretKey(_secretKey),
        expiresIn: Duration(seconds: _expiredTime));

    return token;
  }
}
