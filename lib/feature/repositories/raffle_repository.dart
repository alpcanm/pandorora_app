import 'package:pandorora_app/core/network/raffle_service.dart';

import '../../core/models/raffle.dart';

abstract class IRaffleRepository {
  Future<List<Raffle>?> getRaffles(int startIndex, {List<String>? filters});
  Future<List<Raffle>> myFutureRaffles(String userId);
  Future<List<Raffle>> myPastRaffles(String userId);
}

class RaffleRepository implements IRaffleRepository {
  final RaffleService _raffleService = RaffleService();

  @override
  Future<List<Raffle>?> getRaffles(int startIndex,
      {List<String>? filters}) async {
    if (filters != null) {
      return _getFilteredRaffles(startIndex, filters);
    }
    return _getAllRaffles(startIndex);
  }

  Future<List<Raffle>?> _getFilteredRaffles(
      int startIndex, List<String> filters) async {
    List<Raffle> _result = [];

    if (filters.isNotEmpty) {
      List? _response =
          await _raffleService.getFilteredRaffles(startIndex, filters);
      if (_response != null) {
        for (var element in _response) {
          _result.add(Raffle.fromMap(element));
        }
        return _result;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<List<Raffle>?> _getAllRaffles(int startIndex) async {
    List<Raffle> _result = [];

    List? _response = await _raffleService.getAllRaffles(startIndex);
    if (_response != null) {
      for (var element in _response) {
        _result.add(Raffle.fromMap(element));
      }
      return _result;
    } else {
      return null;
    }
  }

  @override
  Future<List<Raffle>> myFutureRaffles(String userId) {
    // TODO: implement myFutureRaffles
    throw UnimplementedError();
  }

  @override
  Future<List<Raffle>> myPastRaffles(String userId) {
    // TODO: implement myPastRaffles
    throw UnimplementedError();
  }
}
