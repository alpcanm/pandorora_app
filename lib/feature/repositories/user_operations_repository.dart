import '../../core/network/user_service.dart';
import '../../core/utils/locator_get_it.dart';

import 'global_repository.dart';

abstract class IUserOperationsRepository {
  Future<bool> signUp(
      {required String name,
      required String mail,
      required String password,
      required String raffleNickName});
  Future<bool> updateMail({
    required String uid,
    required String mail,
  });
  Future<bool> updateUserData({
    required String uid,
    String? name,
    String? raffleNickName,
  });

  Future<bool> changePassword(
      {required String idToken, required String newPassword});
  Future<String?> signInAndGetIdToken(
      {required String mail, required String password});
}

class UserOperationsRepository implements IUserOperationsRepository {
  final _globalRepo = getIt<GlobalRepository>();
  final _userDBService = getIt<UserService>();
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  @override
  Future<bool> signUp(
      {required String name,
      required String mail,
      required String raffleNickName,
      required String password}) async {
    try {
      String? _loacalId = await _globalRepo.authService
          .signUpAndGetUid(mail: mail, password: password);
      if (_loacalId != null) {
        bool _dbSignUp = await _userDBService.signUp(
          raffleNickName: raffleNickName,
          uid: _loacalId,
          name: name,
          mail: mail,
        );
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

  @override
  Future<bool> updateMail({required String uid, required String mail}) {
    throw UnimplementedError();
  }

  @override
  Future<bool> updateUserData(
      {required String uid, String? name, String? raffleNickName}) async {
    return _userDBService.updateUserData(
        uid: uid, name: name, raffleNickName: raffleNickName);
  }

  @override
  Future<bool> changePassword(
      {required String idToken, required String newPassword}) async {
    return await _globalRepo.authService
        .changePassword(idToken: idToken, newPassword: newPassword);
  }

  @override
  Future<String?> signInAndGetIdToken(
      // Şifre değiştirme kontrolünde kullanılıyor.
      {required String mail,
      required String password}) async {
    final _result = await _globalRepo.authService
        .signInWithPassword(mail: mail, password: password);
    return _result["idToken"];
  }
}
