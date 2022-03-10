import 'dart:convert';

class Product {
  String? productId;
  String? title;
  String? comment;
  int? drawDate;
  String? photoURL;
  bool? isExpired;
  String? tag;
  String? drawURL;
  Product({
    this.productId,
    this.title,
    this.comment,
    this.drawDate,
    this.photoURL,
    this.isExpired,
    this.tag,
    this.drawURL,
  });

  Map<String, dynamic> toMap() {
    return {
      'product_id': productId,
      'title': title,
      'comment': comment,
      'draw_date': drawDate,
      'photo_url': photoURL,
      'is_expired': isExpired,
      'tag': tag,
      'draw_url': drawURL,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productId: map['product_id'],
      title: map['title'],
      comment: map['comment'],
      drawDate: map['draw_date'],
      photoURL: map['photo_url'],
      isExpired: map['is_expired'],
      tag: map['tag'],
      drawURL: map['draw_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
