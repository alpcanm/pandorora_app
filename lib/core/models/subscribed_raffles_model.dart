import 'dart:convert';

import 'raffle.dart';

class SubscribedRafflesModel {
  Set<Raffle>? subscribedRaffles;

  Set<Raffle> futureRaffleList = {};
  Set<Raffle> pastRaffleList = {};
  SubscribedRafflesModel({this.subscribedRaffles});

  factory SubscribedRafflesModel.fromMap(Map<String, dynamic> map) {
    return SubscribedRafflesModel(
      subscribedRaffles: map['subscribed_raffles'] != null ? Set<Raffle>.from(map['subscribed_raffles']?.map((x) => Raffle.fromMap(x))) : null,
    );
  }

  factory SubscribedRafflesModel.fromJson(String source) => SubscribedRafflesModel.fromMap(json.decode(source));
}
