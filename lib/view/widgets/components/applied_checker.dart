import 'package:pandorora_app/core/utils/locator_get_it.dart';

import '../../../feature/repositories/global_repository.dart';

class Checker {
  static bool applyCheck(String productId) {
    bool _result = false;
    getIt<GlobalRepository>().user?.appliedDraws?.forEach((element) {
      if (element == productId) {
        _result = true;
      }
    });
    return _result;
  }
}
