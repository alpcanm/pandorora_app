import 'package:flutter/material.dart';

class WC {
  static Widget tpDivider = const Divider(color: Colors.transparent);

  static Padding paddingAll({required Widget child}) {
    const double paddingAllValue = 8.0;
    return Padding(
        padding: const EdgeInsets.all(paddingAllValue), child: child);
  }
}
