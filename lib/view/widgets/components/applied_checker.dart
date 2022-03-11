import '../../../core/utils/locator_get_it.dart';

import '../../../feature/repositories/global_repository.dart';

class Checker {
  static bool applyCheck(String raffleId) {
    bool _result = false;
    getIt<GlobalRepository>().user?.subscribedRaffles?.forEach((element) {
      if (element == raffleId) {
        _result = true;
      }
    });
    return _result;
  }
}
