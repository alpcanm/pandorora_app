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
  String? drawNickName;
  List<String?>? appliedDraws;
  int? tickets;

  User({
    this.uid,
    this.name,
    this.surname,
    this.mail,
    this.phoneNumber,
    this.photoURL,
    this.password,
    this.mailVerified,
    this.drawNickName,
    this.appliedDraws,
    this.tickets,
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
      'mail_verified': mailVerified,
      'tickets': tickets,
      'draw_nick_name': drawNickName,
      'applied_draws': appliedDraws,
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
      tickets: map['tickets'],
      drawNickName: map['draw_nick_name'],
      appliedDraws: map['applied_draws'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(uid: $uid, name: $name, surname: $surname, mail: $mail, phoneNumber: $phoneNumber, photoURL: $photoURL, password: $password, mailVerified: $mailVerified, drawNickName: $drawNickName, appliedDraws: $appliedDraws, tickets: $tickets)';
  }
}
