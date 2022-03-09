import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/product.dart';
import '../../../widgets/_/count_down/count_down.dart';

import '../../../../core/navigation/navigation_manager.gr.dart';

class ConsoleCard extends StatelessWidget {
  const ConsoleCard(this.product, {Key? key}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        onTap: (() {
          context.router.push(ProductRoute(product: product));
        }),
        leading: Image.network(product.photoURL ?? ""),
        title: Text(product.title ?? ""),
        subtitle: Text(product.comment ?? "",
            maxLines: 1, overflow: TextOverflow.ellipsis),
        trailing: SizedBox(
            width: 100, child: CountDownArea(dateTime: product.drawDate!)),
      ),
    );
  }
}
