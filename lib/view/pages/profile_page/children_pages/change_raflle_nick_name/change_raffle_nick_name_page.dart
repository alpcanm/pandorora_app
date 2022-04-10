import 'package:flutter/material.dart';

import '../../_components/profile_child_app_bar.dart';

class ChangeRaffleNickNamePage extends StatelessWidget {
  const ChangeRaffleNickNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileChildAppBar(context),
    );
  }
}
