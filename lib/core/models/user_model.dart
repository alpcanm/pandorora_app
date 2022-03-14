import 'dart:convert';

class User {
  String? uid;
  String? name;
  String? surname;
  String? mail;

  String? phoneNumber;
  String? photoURL;
  String? password;
  bool? mailVerified;
  String? subscribeNickName;

  User({
    this.uid,
    this.name,
    this.surname,
    this.mail,
    this.phoneNumber,
    this.photoURL,
    this.password,
    this.mailVerified,
    this.subscribeNickName,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'surname': surname,
      'mail': mail,
      'phone_number': phoneNumber,
      'photo_url': photoURL,
      'password': password,
      'subscribe_nick_name': subscribeNickName,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'].toString(),
      name: map['name'],
      surname: map['surname'],
      mail: map['mail'],
      phoneNumber: map['phone_number'],
      photoURL: map['photo_url'],
      password: map['password'],
      mailVerified: map['mailVerified'],
      subscribeNickName: map['subscribe_nick_name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
