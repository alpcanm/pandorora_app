
import 'package:firebase_auth_rest/firebase_auth_rest.dart';
import 'package:pandorora_app/core/constants/keys.dart';
import 'package:pandorora_app/core/models/user_model.dart';
import 'package:pandorora_app/core/network/user_service.dart';
import 'package:pandorora_app/core/utils/json_webtoken.dart';
import 'package:pandorora_app/core/utils/locator_get_it.dart';
import 'package:pandorora_app/feature/repositories/init_repository.dart';

enum AuthStatus {
  unknown,
  authenticated,
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
  late AuthService _authService;

  final _initRepository = getIt<
      InitRepository>(); 
  final _userDBService =
      UserService(); 

  AuthStatus _status = AuthStatus.unknown;
  get status =>
      _status; 

  AuthRepository() {
    _authService = AuthService(_initRepository
        .firebaseApiKey!); 
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
          _status = AuthStatus.authenticated;
          return _result;
        } else {
          await _initRepository.tokenCache.clearBox();
          _status = AuthStatus.unauthenticated;
          return null;
        }
      } catch (e) {
        await _initRepository.tokenCache.clearBox();
      }
    } else {
      _status = AuthStatus.unauthenticated;
      return null;
    }
  }

  @override
  Future<bool> signIn({required String mail, required String password}) async {
    String? _localId =
        await _authService.signInAndGetUid(mail: mail, password: password);
    if (_localId != null) {
      String _token = JwtManager({'uid': _localId}).signJwt();
      await _initRepository.tokenCache.clearBox();
      await _initRepository.tokenCache.addToBox(_token);
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
    String? _loacalId =
        await _authService.signUpAndGetUid(mail: mail, password: password);
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
    _status = AuthStatus.unauthenticated;
    return true;
  }
}
