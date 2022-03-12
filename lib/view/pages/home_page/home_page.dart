import 'package:flutter/material.dart';
import '../../widgets/components/custom_app_bar.dart';
import 'home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context),
      body: const HomeBody(),
    );
  }
}
