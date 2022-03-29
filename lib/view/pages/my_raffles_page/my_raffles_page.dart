import 'package:flutter/material.dart';
import '../profile_page/_components/profile_child_app_bar.dart';
import 'my_raffles_body.dart';

class MyRafflesPage extends StatelessWidget {
  const MyRafflesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileChildAppBar(context),
      body: MyRafflesBody(),
    );
  }
}
