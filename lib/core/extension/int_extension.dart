extension IntDateExtension on int {
  DateTime get toDate => DateTime.fromMillisecondsSinceEpoch(this);
}
