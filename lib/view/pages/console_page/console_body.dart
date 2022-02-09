import 'package:flutter/material.dart';
import 'package:pandorora_app/core/models/product.dart';
import 'package:pandorora_app/view/pages/home_page/home_body.dart';
import 'components/consoler_card.dart';

class ConsoleBody extends StatelessWidget {
  ConsoleBody({Key? key}) : super(key: key);
  final PageController _pageViewController = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: consoleButtons()),
        Expanded(
          flex: 20,
          child: PageView(
            controller: _pageViewController,
            scrollDirection: Axis.horizontal,
            children: [futureProducts(), pastProducts()],
          ),
        ),
      ],
    );
  }

  ListView futureProducts() {
    return ListView.builder(
      itemBuilder: (context, index) {
        final _product = Product(
          comment:
              "AçıklamaAçıklamaAç   amaamaıklamaAçıkla  maAçıklama  çıklamaAçıklama",
          drawDate: DateTime(
            2022,
            2,
            28,
          ),
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

  ListView pastProducts() {
    return ListView.builder(
      itemBuilder: (context, index) {
        final _product = Product(
          comment: "Açıklama",
          drawDate: DateTime(
            2022,
            2,
            28,
          ),
          isExpired: false,
          photoURL: imageURL,
          productId: "516516546514",
          title: "Klavye Mouse",
          tag: "#Mutfak malzemesi",
        );

        return ConsoleCard(_product);
      },
      itemCount: 4,
      shrinkWrap: true,
    );
  }

  Widget consoleButtons() {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              _pageViewController.animateToPage(0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeOutSine);
            },
            child: const Text("Gelecek"),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              _pageViewController.animateToPage(1,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeOutSine);
            },
            child: const Text("Geçmiş"),
          ),
        )
      ],
    );
  }
}
