library product_card;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pandorora_app/core/extension/context_extension.dart';
import 'package:pandorora_app/core/models/product.dart';
import 'package:pandorora_app/view/widgets/_/count_down/count_down.dart';
import 'package:pandorora_app/view/widgets/components/applied_checker.dart';

import '../../../../../core/navigation/navigation_manager.gr.dart';

part 'components/product_card_body.dart';
part 'components/product_card_header.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required Product product})
      : _product = product,
        super(key: key);

  final Product _product;
  final _cardMargin = const EdgeInsets.only(left: 21, right: 21, top: 13);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height * 0.5;
    return SizedBox(
      height: _height,
      child: Card(
          color: Colors.purple,
          margin: _cardMargin,
          child: Column(
            children: [
              _ProductCardHeader(product: _product),
              _ProductCardBody(product: _product),
            ],
          ),
          elevation: 4),
    );
  }
}
