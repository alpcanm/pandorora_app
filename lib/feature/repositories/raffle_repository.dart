import 'dart:convert';

import 'package:pandorora_app/core/network/raffle_service.dart';
import 'package:pandorora_app/feature/repositories/global_repository.dart';

import '../../core/models/raffle.dart';
import '../../core/models/users_raffle_list.dart';
import '../../core/utils/locator_get_it.dart';

abstract class IRaffleRepository {
  Future<List<Raffle>?> getRaffles(int startIndex, {Set<String>? filters});
  Future<UsersRaffleList> myRaffles();
}

class RaffleRepository implements IRaffleRepository {
  final RaffleService _raffleService = RaffleService();

  @override
  Future<List<Raffle>?> getRaffles(int startIndex,
      {Set<String>? filters}) async {
    if (filters != null) {
      return _getFilteredRaffles(startIndex, filters);
    }
    return _getAllRaffles(startIndex);
  }

  Future<List<Raffle>?> _getFilteredRaffles(
      int startIndex, Set<String> filters) async {
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
  Future<UsersRaffleList> myRaffles() async {
    var _response =
        await _raffleService.myRaffles(getIt<GlobalRepository>().user!.uid!);

    UsersRaffleList _notFetchedList = UsersRaffleList.fromMap(_response);
    for (Raffle item in _notFetchedList.raffleList!) {
      if (item.date! > DateTime.now().millisecondsSinceEpoch) {
        _notFetchedList.futureRaffleList.add(item);
      } else {
        _notFetchedList.pastRaffleList.add(item);
      }
    }
    return _notFetchedList;
  }
}
