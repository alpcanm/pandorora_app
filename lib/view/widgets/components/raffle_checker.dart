import '../../../core/models/raffle.dart';
import '../../../core/utils/locator_get_it.dart';
import '../../../feature/repositories/global_repository.dart';

class RaffleChecker {
  static bool checker(String raffleId) {
    final Set<Raffle>? _raffleList =
        getIt<GlobalRepository>().usersRaffleList.raffleList;

    for (Raffle item in _raffleList ?? {}) {
      if (item.raffleId == raffleId) {
        return true;
      }
    }
    return false;
  }
}
