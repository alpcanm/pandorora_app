class Product {
  String? productId;
  String? title;
  String? comment;
  DateTime? date;
  String? photoURL;
  bool? isCompleted;
  int? differentApply;

  Product(
      {this.productId,
      this.title,
      this.comment,
      this.date,
      this.photoURL,
      this.isCompleted,
      this.differentApply});
}
