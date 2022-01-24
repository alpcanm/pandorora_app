import 'package:firebase_auth_rest/firebase_auth_rest.dart';
import 'package:pandorora_app/core/models/user_model.dart';

import '../../core/constants/keys.dart';
import '../../core/network/init_service.dart';
import '../../core/utils/db_manager.dart';

class GlobalRepository {
  final InitService _initService = InitService();
  String? _firebaseApiKey;
  String? get firebaseApiKey => _firebaseApiKey;
  String? errorMessage;
  User? user;
  Future getFirebaseApiKey() async {
    _firebaseApiKey = await _initService.getFirebaseApiKey();
  }

  final DBManager tokenCache = TokenCacheManager(Keys.token);

  Future<void> tokenInit() async {
    await tokenCache.init();
  }

  late AuthService authService;
  void authServiceInit() {
    authService = AuthService(firebaseApiKey!);
  }
}
