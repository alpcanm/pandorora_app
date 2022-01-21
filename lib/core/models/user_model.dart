import 'dart:convert';

class User {
  String? uid;
  String? name;
  String? surname;
  String? mail;
  DateTime? createdAt;

  User({
    this.uid,
    this.name,
    this.surname,
    this.mail,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'surname': surname,
      'mail': mail,
      'created_at': createdAt.toString(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'].toString(),
      name: map['name'],
      surname: map['surname'],
      mail: map['mail'],
      createdAt: DateTime.tryParse(map['created_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
