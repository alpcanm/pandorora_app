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
  final _initRepository = getIt<GlobalRepository>();
  final _userDBService = UserService();
  AuthStatus _authStatus = AuthStatus.unknown;
  AuthStatus get authGuardStatus => _authStatus;
  final _statusController = StreamController<AuthStatus>()
    ..sink.add(AuthStatus.unknown);
  Stream<AuthStatus> get authStatus async* {
    yield* _statusController.stream;
  }

  @override
  Future<User?> tryGetCurrentUser() async {
    String? _token;

    if (_initRepository.tokenCache.isNotEmpty(Keys.token) == true) {
      _token = _initRepository.tokenCache.getValues(Keys.token)?.first;
    }

    if (_token != null) {
      try {
        User? _result = await _userDBService.readUserData(token: _token);
        if (_result != null) {
          _statusLogger(AuthStatus.authenticated);

          return _result;
        } else {
          await _initRepository.tokenCache.clearBox();
          _statusLogger(AuthStatus.unauthenticated);

          return null;
        }
      } catch (e) {
        await _initRepository.tokenCache.clearBox();
      }
    } else {
      _statusLogger(AuthStatus.unauthenticated);
      return null;
    }
  }

  @override
  Future<bool> signIn({required String mail, required String password}) async {
    String? _localId = await _initRepository.authService
        .signInAndGetUid(mail: mail, password: password);
    if (_localId != null) {
      String _token = JwtManager({'uid': _localId}).signJwt();

      await _initRepository.tokenCache.clearBox();
      await _initRepository.tokenCache.addToBox(_token);

      _statusLogger(AuthStatus.progressAuthenticated);
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> signUp(
      {required String name,
      required String surname,
      required String mail,
      required String password}) async {
    String? _loacalId = await _initRepository.authService
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
  }

  @override
  Future<bool> signOut() async {
    await _initRepository.tokenCache.clearBox();
    _statusLogger(AuthStatus.unauthenticated);
    return true;
  }

  void _statusLogger(AuthStatus value) {
    _statusController.add(value);
    _authStatus = value;
  }
}
