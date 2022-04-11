import 'dart:convert';

class User {
  String? uid;
  String? name;

  String? mail;

  String? phoneNumber;
  String? photoURL;
  String? password;

  String? raffleNickName;

  User({
    this.uid,
    this.name,
    this.mail,
    this.phoneNumber,
    this.photoURL,
    this.password,
    this.raffleNickName,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'mail': mail,
      'phone_number': phoneNumber,
      'photo_url': photoURL,
      'password': password,
      'raffle_nick_name': raffleNickName,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
