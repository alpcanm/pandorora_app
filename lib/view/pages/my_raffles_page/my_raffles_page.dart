import 'package:flutter/material.dart';
import 'my_raffles_body.dart';
import '../../widgets/components/custom_app_bar.dart';

class MyRafflesPage extends StatelessWidget {
  const MyRafflesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context),
      body: MyRafflesBody(),
    );
  }
}
