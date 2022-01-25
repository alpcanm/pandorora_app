import 'dart:async';

import '../../core/constants/keys.dart';
import '../../core/models/user_model.dart';
import '../../core/network/user_service.dart';
import '../../core/utils/json_webtoken.dart';
import '../../core/utils/locator_get_it.dart';
import 'global_repository.dart';

enum AuthStatus {
  unknown,
  authenticated,
  progressAuthenticated,
  unauthenticated
}

abstract class IAuthRepository {
  Future<User?> tryGetCurrentUser();
  Future<bool> signOut();
  Future<bool> signIn({required String mail, required String password});
  Future<bool> signUp(
      {required String name,
      required String surname,
      required String mail,
      required String password});
}

class AuthRepository implements IAuthRepository {
  final _globalRepo = getIt<GlobalRepository>();
  final _userDBService = UserService();
  AuthStatus _authStatus = AuthStatus.unknown;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  AuthStatus get authGuardStatus => _authStatus;

  @override
  Future<User?> tryGetCurrentUser() async {
    String? _token;

    if (_globalRepo.tokenCache.isNotEmpty(Keys.token) == true) {
      _token = _globalRepo.tokenCache.getValues(Keys.token)?.first;
    }

    if (_token != null) {
      try {
        User? _result = await _userDBService.readUserData(token: _token);
        if (_result != null) {
          _statusLogger(AuthStatus.authenticated);

          return _result;
        } else {
          await _globalRepo.tokenCache.clearBox();
          _statusLogger(AuthStatus.unauthenticated);

          return null;
        }
      } catch (e) {
        await _globalRepo.tokenCache.clearBox();
      }
    } else {
      _statusLogger(AuthStatus.unauthenticated);
      return null;
    }
  }

  @override
  Future<bool> signIn({required String mail, required String password}) async {
    try {
      String? _localId = await _globalRepo.authService
          .signInAndGetUid(mail: mail, password: password);
      if (_localId != null) {
        String _token = JwtManager({'uid': _localId}).signJwt();

        await _globalRepo.tokenCache.clearBox();
        await _globalRepo.tokenCache.addToBox(_token);

        _statusLogger(AuthStatus.progressAuthenticated);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      _errorMessage = e.toString();
      return false;
    }
  }

  @override
  Future<bool> signUp(
      {required String name,
      required String surname,
      required String mail,
      required String password}) async {
    try {
      String? _loacalId = await _globalRepo.authService
          .signUpAndGetUid(mail: mail, password: password);
      if (_loacalId != null) {
        bool _dbSignUp = await _userDBService.signUp(
            uid: _loacalId, name: name, surname: surname, mail: mail);
        if (_dbSignUp) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      _errorMessage = e.toString();
      return false;
    }
  }

  cancelStream() async {}

  @override
  Future<bool> signOut() async {
    _statusLogger(AuthStatus.unauthenticated);
    await _globalRepo.tokenCache.clearBox();
    return true;
  }

  void _statusLogger(AuthStatus value) {
    _authStatus = value;
    _authStatus = value;
  }
}
