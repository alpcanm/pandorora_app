import 'dart:convert';

class SubscriberModel {
  final String subscriberName;
  final String subscriberId;
  final int subscribeDate;
  SubscriberModel({
    required this.subscriberName,
    required this.subscriberId,
    required this.subscribeDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'subscriber_name': subscriberName,
      'subscriber_id': subscriberId,
      'subscribe_date': subscribeDate,
    };
  }

  factory SubscriberModel.fromMap(Map<String, dynamic> map) {
    return SubscriberModel(
      subscriberName: map['subscriber_name'] ?? '',
      subscriberId: map['subscriber_id'] ?? '',
      subscribeDate: map['subscribe_date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SubscriberModel.fromJson(String source) =>
      SubscriberModel.fromMap(json.decode(source));
}
