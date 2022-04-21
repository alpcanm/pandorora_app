import 'dart:convert';

import 'package:pandorora_app/core/models/mini_raffle_model.dart';

class User {
  String? uid;
  String? name;

  String? mail;

  String? phoneNumber;
  String? photoURL;
  String? password;

  String? raffleNickName;
  List<MiniRaffleModel?>? subscribedRaffles;
  User(
      {this.uid,
      this.name,
      this.mail,
      this.phoneNumber,
      this.photoURL,
      this.password,
      this.raffleNickName,
      this.subscribedRaffles});

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'mail': mail,
      'phone_number': phoneNumber,
      'photo_url': photoURL,
      'password': password,
      'raffle_nick_name': raffleNickName,
      'subscribed_raffles': subscribedRaffles?.map((x) => x?.toMap()).toList(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'].toString(),
      name: map['name'],
      mail: map['mail'],
      phoneNumber: map['phone_number'],
      photoURL: map['photo_url'],
      password: map['password'],
      raffleNickName: map['raffle_nick_name'],
      subscribedRaffles: map['subscribed_raffles'] != null
          ? List<MiniRaffleModel?>.from(map['subscribed_raffles']
              ?.map((x) => MiniRaffleModel?.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
