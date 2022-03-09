import '../../core/network/user_service.dart';
import '../../core/utils/locator_get_it.dart';

import 'global_repository.dart';

abstract class IUserOperationsRepository {
  Future<bool> update(
      {String? name, String? surname, String? mail, String? drawNickName});
  Future<bool> signUp({
    required String name,
    required String surname,
    required String mail,
    required String password,
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
    String? drawNickName,
  });

  Future<bool> changePassword(
      {required String idToken, required String newPassword});
  Future<String?> signInAndGetIdToken(
      {required String mail, required String password});
}

class UserOperationsRepository implements IUserOperationsRepository {
  final _globalRepo = getIt<GlobalRepository>();
  final _userDBService = UserService();
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  @override
  Future<bool> update(
      {String? name,
      String? surname,
      String? mail,
      String? drawNickName}) async {
    await Future.delayed(const Duration(seconds: 2));

    return true;
  }

  @override
  Future<bool> signUp(
      {required String name,
      required String surname,
      required String mail,
      required String phoneNumber,
      required String password}) async {
    try {
      String? _loacalId = await _globalRepo.authService
          .signUpAndGetUid(mail: mail, password: password);
      if (_loacalId != null) {
        bool _dbSignUp = await _userDBService.signUp(
            uid: _loacalId,
            name: name,
            surname: surname,
            mail: mail,
            phoneNumber: phoneNumber);
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
    // TODO: implement updateMail
    throw UnimplementedError();
  }

  @override
  Future<bool> updateUserData(
      {required String uid,
      String? name,
      String? surname,
      String? drawNickName}) {
    // TODO: implement updateUserData
    throw UnimplementedError();
  }

  @override
  Future<bool> changePassword(
      {required String idToken, required String newPassword}) async {
    return await _globalRepo.authService
        .changePassword(idToken: idToken, newPassword: newPassword);
  }

  @override
  Future<String?> signInAndGetIdToken(
      {required String mail, required String password}) async {
    return await _globalRepo.authService
        .signInAndGetIdToken(mail: mail, password: password);
  }
}
