import 'package:flutter/material.dart';

import '../../widgets/components/custom_app_bar.dart';
import 'profile_body.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context),
      body: const ProfileBody(),
    );
  }
}
