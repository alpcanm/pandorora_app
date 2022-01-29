import 'package:flutter/material.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.widget.toString()),
      ),
    );
  }
}
