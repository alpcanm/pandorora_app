import 'package:flutter/material.dart';

class FilterRepository {
  static Map get tags {
    return {
      "tag1": "Kozmetik, Kişisel bakım",
      "tag4": "Giyim",
      "tag5": "Ev eşyası",
      "tag3": "Gıda,mutfak",
      "tag8": "Hediyelik",
      "tag6": "Kitap/Kırtasiye",
      "tag7": "Müzik/Enstrüman",
      "tag2": "Elektronik/Teknolojik alet",
      "tag9": "Temel gıda",
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
