import '../../core/network/raffle_service.dart';
import 'global_repository.dart';

import '../../core/models/raffle.dart';
import '../../core/models/subscribed_raffles_model.dart';
import '../../core/utils/locator_get_it.dart';

abstract class IRaffleRepository {
  Future<List<Raffle>?> getRaffles(int startIndex, {Set<String>? filters});
  Future<SubscribedRafflesModel?> getSubscribedRaffles();
  Future<bool> subscribeARaffle(String raffleId, int date);
}

class RaffleRepository implements IRaffleRepository {
  final RaffleService _raffleService = getIt<RaffleService>();
  final GlobalRepository _globalRepo = getIt<GlobalRepository>();
  @override
  Future<List<Raffle>?> getRaffles(int startIndex, {Set<String>? filters}) async {
    List<Raffle> _result = [];
    //productSerivce e istek gönderilir.
    final _response = await _raffleService.getRaffles(startIndex, filters: filters);
    if (_response != null) {
      for (var item in _response) {
        //gelen cevap null değilse içerisindeki veriler ProductModele dönüştürülür ve liste içerisine atılır.
        _result.add(Raffle.fromMap(item));
      }
      return _result;
    }
    return null;
  }

  @override
  Future<SubscribedRafflesModel?> getSubscribedRaffles() async {
    if (_globalRepo.user == null) {
      return null;
    } // eğer oturum açmadan giriş yapmışsa direkt fonksiyondan çıkacak.
    var _response = await _raffleService.myRaffles(_globalRepo.user?.uid);
    if (_response != null) {
      // subscribe edilmiş raffller modele dönüştürüp global repository e bildiriyor.

      _globalRepo.usersRaffleList = SubscribedRafflesModel.fromMap(_response);

      for (Raffle item in _globalRepo.usersRaffleList.subscribedRaffles ?? []) {
        if (item.date! > DateTime.now().millisecondsSinceEpoch) {
          _globalRepo.usersRaffleList.futureRaffleList.add(item);
        } else {
          _globalRepo.usersRaffleList.pastRaffleList.add(item);
        }
      }
      return _globalRepo.usersRaffleList;
    } else {
      return null;
    }
  }

  @override
  Future<bool> subscribeARaffle(String raffleId, int date) {
    return _raffleService.subscribeARaffle(raffleId: raffleId, userId: _globalRepo.user!.uid!, date: date, raffleNickName: _globalRepo.user!.raffleNickName ?? "BOŞ ŞUAN");
  }
}
