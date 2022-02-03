import 'package:flutter/material.dart';
import 'components/consoler_card.dart';

class ConsoleBody extends StatelessWidget {
  const ConsoleBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const ConsoleCard();
      },
      itemCount: 4,
      shrinkWrap: true,
    );
  }
}
