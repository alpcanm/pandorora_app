import 'dart:convert';

class SubscriberModel {
  final String raffleNickName;
  final String subscriberId;
  final int subscribeDate;
  SubscriberModel({
    required this.raffleNickName,
    required this.subscriberId,
    required this.subscribeDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'raffle_nick_name': raffleNickName,
      'subscriber_id': subscriberId,
      'subscribe_date': subscribeDate,
    };
  }

  factory SubscriberModel.fromMap(Map<String, dynamic> map) {
    return SubscriberModel(
      raffleNickName: map['raffle_nick_name'] ?? '',
      subscriberId: map['subscriber_id'] ?? '',
      subscribeDate: map['subscribe_date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SubscriberModel.fromJson(String source) =>
      SubscriberModel.fromMap(json.decode(source));
}
