import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:pandorora_app/core/models/product.dart';
import 'package:pandorora_app/core/utils/locator_get_it.dart';
import 'package:pandorora_app/feature/repositories/global_repository.dart';
import 'package:pandorora_app/view/widgets/_/count_down/count_down.dart';
import 'package:pandorora_app/view/widgets/components/applied_checker.dart';

import '../../../../core/navigation/navigation_manager.gr.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key, required Product product})
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
              header(context),
              body(context),
            ],
          ),
          elevation: 4),
    );
  }

  Expanded header(BuildContext context) {
    bool _isApplied = Checker.applyCheck(_product.productId ?? "");
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _product.tag ?? "",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontSize: 14, color: Colors.yellow),
            ),
            Text(
              _isApplied ? "Katıldın" : "",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.yellow),
            )
          ],
        ),
      ),
    );
  }

  Expanded body(BuildContext context) => Expanded(
        flex: 9,
        child: InkWell(
          onTap: () => context.router.push(ProductRoute(product: _product)),
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.network(
                    _product.photoURL ?? "",
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 75,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: const EdgeInsets.all(8),
                      elevation: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              flex: 30,
                              child: Center(
                                child: Text(
                                  _product.title ?? "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(color: Colors.black),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 15,
                              child: CountDownArea(
                                dateTime: _product.drawDate!,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
