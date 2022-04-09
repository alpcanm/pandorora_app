import 'package:firebase_auth_rest/firebase_auth_rest.dart';
import '../../core/models/raffle.dart';
import '../../core/models/users_raffle_list.dart';
import '../../core/utils/locator_get_it.dart';
import 'auth_repository.dart';

import '../../core/constants/keys.dart';
import '../../core/models/user_model.dart';
import '../../core/network/init_service.dart';
import '../../core/utils/db_manager.dart';

class GlobalRepository {
  final InitService _initService = InitService();
  String? _firebaseApiKey;
  String? get firebaseApiKey => _firebaseApiKey;

  User? _user;
  User? get user => _user;

  UsersRaffleList usersRaffleList = UsersRaffleList();

  Future getFirebaseApiKey() async {
    _firebaseApiKey = await _initService.getFirebaseApiKey();
  }

  final ICacheManager tokenCache = CacheManager(Keys.token);
  final ICacheManager signInCache = CacheManager(Keys.singIn);

  Future<void> tokenInit() async {
    await Future.wait([
      signInCache.init(),
      tokenCache.init(),
    ]);
  }

  bool checker(String raffleId) {
    final Set<Raffle>? _raffleList =
        getIt<GlobalRepository>().usersRaffleList.raffleList;

    for (Raffle item in _raffleList ?? {}) {
      if (item.raffleId == raffleId) {
        return true;
      }
    }
    return false;
  }

  void logOut() {
    _user = null;
    usersRaffleList = UsersRaffleList();
  }

  late AuthService authService;
  void authServiceInit() {
    authService = AuthService(firebaseApiKey!);
  }

  Future<void> tryGetCurrentUser() async {
    _user = await getIt<AuthRepository>().tryGetCurrentUser();
  }
}
