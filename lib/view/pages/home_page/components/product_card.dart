import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/navigation/navigation_manager.gr.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
  }) : super(key: key);
  final _cardMargin = const EdgeInsets.only(left: 21, right: 21, top: 13);
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height * 0.5;
    return SizedBox(
      height: _height,
      child: Card(
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
    return Expanded(
      child: Container(
        color: Colors.purple,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Çamaşır Deterjanı',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                'Katıldın',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.yellow),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Expanded body(BuildContext context) => Expanded(
      flex: 8,
      child: InkWell(
        onTap: () => context.router.push(const ProductRoute()),
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.network(
                  imageURL,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            const Positioned.fill(
              child: Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                    height: 35,
                    width: 100,
                    child: Placeholder(
                      key: Key('SAYAÇ'),
                    )),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: EdgeInsets.all(8),
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [Text('21.15.22'), Text('15:00')],
                        ),
                        Text('#Mutfak malzemesi')
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

String imageURL =
    'https://images.unsplash.com/photo-1481349518771-20055b2a7b24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2139&q=80';
