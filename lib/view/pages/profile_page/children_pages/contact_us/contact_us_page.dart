import 'package:flutter/material.dart';
import '../../_components/profile_child_app_bar.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileChildAppBar(context),
    );
  }
}
