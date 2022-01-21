import 'package:pandorora_app/core/constants/keys.dart';
import 'package:pandorora_app/core/network/init_service.dart';
import 'package:pandorora_app/core/utils/db_manager.dart';

class InitRepository {
  final InitService _initService = InitService();
  String? _firebaseApiKey;
  String? get firebaseApiKey => _firebaseApiKey;

  Future getFirebaseApiKey() async {
    _firebaseApiKey = await _initService.getFirebaseApiKey();
  }

  final DBManager tokenCache = TokenCacheManager(Keys.token);

  Future<void> tokenInit() async {
    await tokenCache.init();
  }
}
