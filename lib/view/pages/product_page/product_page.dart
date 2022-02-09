import 'package:flutter/material.dart';
import 'package:pandorora_app/core/models/product.dart';

import '../../widgets/components/applied_checker.dart';

class ProductPage extends StatelessWidget {
  const ProductPage(Product product, {Key? key})
      : _product = product,
        super(key: key);
  final Product _product;
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.width;
    bool _isApplied = Checker.applyCheck(_product.productId ?? "");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: _isApplied == true ? Colors.grey : null,
        onPressed: _isApplied ? null : () {},
        child: const Text(
          'Katıl',
          style: TextStyle(color: Colors.yellow),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text(context.widget.toString()),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _product.title ?? "",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          SizedBox(
              width: _height,
              child: Stack(
                children: [
                  Image.network(_product.photoURL ?? ""),
                  Text(
                    'Ref: ${_product.productId}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              )),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'İzle',
                style: TextStyle(color: Colors.purple),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.yellow),
            ),
          )
        ],
      ),
    );
  }
}
