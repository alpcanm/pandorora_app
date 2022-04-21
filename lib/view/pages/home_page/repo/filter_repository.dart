import 'package:flutter/material.dart';

class FilterRepository {
  static Map<String, String> get tags {
    return {
      "kozmetik": "Kozmetik",
      "giyim": "Giyim",
      "ev_esyasi": "Ev eşyası",
      "gida_mutfak": "Gıda,mutfak",
      "hediyelik": "Hediyelik",
      "kirtasiye": "Kırtasiye",
      "muzik": "Müzik",
      "elektronik": "Elektronik",
    };
  }

  static Map<String, String> get tagIcons {
    return {
      "kozmetik": "assets/icons/cosmetic.svg",
      "elektronik": "assets/icons/keyboard.svg",
      "gida_mutfak": "assets/icons/food.svg",
      "giyim": "assets/icons/clothes.svg",
      "ev_esyasi": "assets/icons/furniture.svg",
      "kirtasiye": "assets/icons/book.svg",
      "muzik": "assets/icons/guitar.svg",
      "hediyelik": "assets/icons/gift.svg",
    };
  }

  static Map<String, Color> get tagColors {
    return {
      "kozmetik": Colors.blue,
      "elektronik": Colors.green,
      "gida_mutfak": Colors.orange,
      "giyim": const Color(0xFFC1134E),
      "ev_esyasi": const Color(0xFFFF4F04),
      "kirtasiye": const Color(0xFF128EF2),
      "muzik": Colors.purple,
      "hediyelik": Colors.lime,
    };
  }

  final animatedSliverKey = GlobalKey<SliverAnimatedListState>();
  bool isTagListOpen = false;
  final List<int> filterShowList = [];
  Set<String> filters = {};

  void insert() {
    animatedSliverKey.currentState!.insertItem(0);
    filterShowList.insert(0, 0);
  }

  void remove(Widget child) {
    filterShowList.removeAt(0);
    animatedSliverKey.currentState!.removeItem(
      0,
      (context, animation) => SizeTransition(
          sizeFactor: animation, axis: Axis.vertical, child: child),
    );
  }
}
