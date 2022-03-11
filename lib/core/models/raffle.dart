import 'dart:convert';

class Raffle {
  String? raffleId;
  String? title;
  String? comment;
  int? date;
  String? photoURL;
  bool? isExpired;
  String? tag;
  String? url;
  Raffle({
    this.raffleId,
    this.title,
    this.comment,
    this.date,
    this.photoURL,
    this.isExpired,
    this.tag,
    this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'raffle_id': raffleId,
      'title': title,
      'comment': comment,
      'date': date,
      'photo_url': photoURL,
      'is_expired': isExpired,
      'tag': tag,
      'url': url,
    };
  }

  factory Raffle.fromMap(Map<String, dynamic> map) {
    return Raffle(
      raffleId: map['raffle_id'],
      title: map['title'],
      comment: map['comment'],
      date: map['date'],
      photoURL: map['photo_url'],
      isExpired: map['is_expired'],
      tag: map['tag'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Raffle.fromJson(String source) => Raffle.fromMap(json.decode(source));
}
