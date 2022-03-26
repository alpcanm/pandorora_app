import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    Key? key,
    required this.titleText,
  }) : super(key: key);
  final String titleText;
  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 28),
    );
  }
}
