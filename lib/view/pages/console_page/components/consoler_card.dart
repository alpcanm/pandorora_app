import 'package:flutter/material.dart';

import '../../home_page/components/product_card.dart';

class ConsoleCard extends StatelessWidget {
  const ConsoleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: Image.network(imageURL),
        title: const Text('Çamaşır Deterjanı'),
        subtitle: const Text('15.03.2022 - 15:25'),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.info),
          splashRadius: 17,
        ),
      ),
    );
  }
}
