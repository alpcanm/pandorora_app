import 'package:flutter/material.dart';
import 'package:pandorora_app/core/models/product.dart';
import 'package:pandorora_app/view/pages/home_page/home_body.dart';
import 'components/consoler_card.dart';

class ConsoleBody extends StatelessWidget {
  const ConsoleBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final _product = Product(
          comment: "Açıklama",
          drawDate: DateTime(
            2022,
            2,
            28,
          ),
          isApplied: index % 2 == 0 ? true : false,
          isExpired: false,
          photoURL: imageURL,
          productId: "516516546514",
          title: "Razer Mouse",
          tag: "#Mutfak malzemesi",
        );
        return ConsoleCard(_product);
      },
      itemCount: 4,
      shrinkWrap: true,
    );
  }
}
