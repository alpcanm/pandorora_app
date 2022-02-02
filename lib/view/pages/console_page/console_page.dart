import 'package:flutter/material.dart';
import 'package:pandorora_app/view/widgets/components/custom_app_bar.dart';

class ConsolePage extends StatelessWidget {
  const ConsolePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context),
    );
  }
}
