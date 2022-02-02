import 'package:flutter/material.dart';
import 'package:pandorora_app/view/pages/home_page/home_body.dart';
import '../../widgets/components/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context),
      body:const HomeBody(),
    );
  }
}
