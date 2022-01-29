import 'dart:convert';

class User {
  String? uid;
  String? name;
  String? surname;
  String? mail;
  DateTime? createdAt;
  String? phoneNumber;
  String? photoURL;
  String? password;
  bool? mailVerified;
  String? drawNickName;

  int? tickets;

  User({
    this.uid,
    this.name,
    this.surname,
    this.mail,
    this.createdAt,
    this.phoneNumber,
    this.photoURL,
    this.password,
    this.mailVerified,
    this.tickets,
    this.drawNickName,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'surname': surname,
      'mail': mail,
      'created_at': createdAt.toString(),
      'phone_number': phoneNumber,
      'photo_url': photoURL,
      'password': password,
      'mail_verified': mailVerified,
      'tickets': tickets,
      'draw_nick_name': drawNickName,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'].toString(),
      name: map['name'],
      surname: map['surname'],
      mail: map['mail'],
      createdAt: DateTime.tryParse(map['created_at']),
      phoneNumber: map['phone_number'],
      photoURL: map['photo_url'],
      password: map['password'],
      mailVerified: map['mailVerified'],
      tickets: map['tickets'],
      drawNickName: map['draw_nick_name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

}
