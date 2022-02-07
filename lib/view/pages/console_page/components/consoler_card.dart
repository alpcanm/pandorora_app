import 'package:flutter/material.dart';

import 'package:pandorora_app/core/models/product.dart';
import 'package:pandorora_app/view/widgets/_/count_down/count_down.dart';

class ConsoleCard extends StatelessWidget {
  const ConsoleCard(this.product, {Key? key}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: Image.network(product.photoURL ?? ""),
        title: Text(product.title ?? ""),
        subtitle: CountDownArea(dateTime: product.drawDate!),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.info),
          splashRadius: 17,
        ),
      ),
    );
  }
}
