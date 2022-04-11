import 'package:flutter/material.dart';

class FilterRepository {
  static Map<String, String> get tags {
    return {
      "tag1": "Kozmetik",
      "tag4": "Giyim",
      "tag5": "Ev eşyası",
      "tag3": "Gıda,mutfak",
      "tag8": "Hediyelik",
      "tag6": "Kırtasiye",
      "tag7": "Müzik",
      "tag2": "Elektronik",
    };
  }

  static Map<String, String> get tagIcons {
    return {
      "tag1": "assets/icons/cosmetic.svg",
      "tag2": "assets/icons/keyboard.svg",
      "tag3": "assets/icons/food.svg",
      "tag4": "assets/icons/clothes.svg",
      "tag5": "assets/icons/furniture.svg",
      "tag6": "assets/icons/book.svg",
      "tag7": "assets/icons/guitar.svg",
      "tag8": "assets/icons/gift.svg",
    };
  }

  static Map<String, Color> get tagColors {
    return {
      "tag1": Colors.blue,
      "tag2": Colors.green,
      "tag3": Colors.orange,
      "tag4": const Color(0xFFC1134E),
      "tag5": const Color(0xFFFF4F04),
      "tag6": const Color(0xFF128EF2),
      "tag7": Colors.purple,
      "tag8": Colors.lime,
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
