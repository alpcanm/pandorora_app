import 'dart:convert';

class MiniRaffleModel {
  final String raffleNickName;
  final String subscriberId;
  final String raffleId;
  final int subscribeDate;
  MiniRaffleModel({
    required this.raffleNickName,
    required this.subscriberId,
    required this.raffleId,
    required this.subscribeDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'raffle_nick_name': raffleNickName,
      'subscriber_id': subscriberId,
      'subscribe_date': subscribeDate,
      'raffle_id': raffleId,
    };
  }

  factory MiniRaffleModel.fromMap(Map<String, dynamic> map) {
    return MiniRaffleModel(
      raffleNickName: map['raffle_nick_name'] ?? '',
      subscriberId: map['subscriber_id'] ?? '',
      subscribeDate: map['subscribe_date'] ?? 0,
      raffleId: map['raffle_id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MiniRaffleModel.fromJson(String source) =>
      MiniRaffleModel.fromMap(json.decode(source));
}
