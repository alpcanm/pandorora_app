import 'package:flutter/material.dart';

class CustomFutureBuilder<T> extends StatelessWidget {
  const CustomFutureBuilder({
    Key? key,
    this.future,
    required this.widget,
  }) : super(key: key);
  final Future<T>? future;
  final Widget Function(BuildContext context, AsyncSnapshot<T> snapshot) widget;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (snapshot.hasData) {
          return widget.call(context, snapshot);
        } else if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text('Awaiting result...'),
          );
        }
      },
    );
  }
}
