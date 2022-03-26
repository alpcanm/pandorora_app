import 'package:flutter/material.dart';
import 'package:pandorora_app/view/pages/profile_page/_components/profile_child_app_bar.dart';

class PhoneVerifyPage extends StatelessWidget {
  const PhoneVerifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileChildAppBar(context),
    );
  }
}
