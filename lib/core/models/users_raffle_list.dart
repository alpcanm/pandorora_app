import 'dart:convert';

import 'package:pandorora_app/core/models/raffle.dart';

class UsersRaffleList {
  Set<Raffle>? raffleList;

  Set<Raffle> futureRaffleList = {};
  Set<Raffle> pastRaffleList = {};
  UsersRaffleList({this.raffleList});

  factory UsersRaffleList.fromMap(Map<String, dynamic> map) {
    return UsersRaffleList(
      raffleList: map['raffle_list'] != null
          ? Set<Raffle>.from(map['raffle_list']?.map((x) => Raffle.fromMap(x)))
          : null,
    );
  }

  factory UsersRaffleList.fromJson(String source) =>
      UsersRaffleList.fromMap(json.decode(source));

  fecthData() {}
}
