import 'dart:async';

import '../../core/models/user_model.dart';
import '../../core/network/user_service.dart';
import '../../core/utils/json_webtoken.dart';
import '../../core/utils/locator_get_it.dart';
import 'global_repository.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

abstract class IAuthRepository {
  Future<User?> tryGetCurrentUser();
  Future<bool> logOut();
  Future<bool> signIn({required String mail, required String password});
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

    if (_globalRepo.tokenCache.isNotEmpty() == true) {
      _token = _globalRepo.tokenCache.getValues()?.first;
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
    }
    _statusLogger(AuthStatus.unauthenticated);
    return null;
  }

  @override
  Future<bool> signIn({required String mail, required String password}) async {
    try {
      final _signInResponse = await _globalRepo.authService
          .signInWithPassword(mail: mail, password: password);
      bool mailVerifCheck = false;
      if (_signInResponse != null) {
        final _idToken = _signInResponse["idToken"];
        mailVerifCheck =
            await _globalRepo.authService.checkUserMailVerified(_idToken);
      }
      String? _localId = _signInResponse["localId"];
      if (_localId != null && mailVerifCheck) {
        String _token = JwtManager({'uid': _localId}).signJwt();
        await _globalRepo.tokenCache.clearBox();
        await _globalRepo.tokenCache.addToBox(_token);
        return true;
      } else if (!mailVerifCheck) {
        _errorMessage = "Lütfen maili doğruladığınızdan emin olunuz.";
        return false;
      } else {
        return false;
      }
    } catch (e) {
      _errorMessage = e.toString();
      return false;
    }
  }

  @override
  Future<bool> logOut() async {
    _statusLogger(AuthStatus.unauthenticated);
    await _globalRepo.tokenCache.clearBox();
    return true;
  }

  void _statusLogger(AuthStatus value) {
    _authStatus = value;
    _authStatus = value;
  }
}
