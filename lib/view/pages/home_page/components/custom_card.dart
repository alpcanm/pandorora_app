import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:pandorora_app/core/navigation/navigation_manager.gr.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(left: 21, right: 21, top: 13),
        child: Column(
          children: [
            header(context),
            body(context),
          ],
        ),
        elevation: 4);
  }

  Expanded body(BuildContext context) => Expanded(
      flex: 8,
      child: InkWell(
        onTap: () => context.router.push(ProductRoute()),
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
      ));

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

String imageURL =
    'https://images.unsplash.com/photo-1481349518771-20055b2a7b24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2139&q=80';
