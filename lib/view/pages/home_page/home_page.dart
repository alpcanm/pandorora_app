import 'package:flutter/material.dart';
import '../../widgets/components/custom_app_bar.dart';

import '../../../core/utils/locator_get_it.dart';

import '../../../feature/repositories/global_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context),
      body: Text(getIt<GlobalRepository>().user?.uid ?? "boş"),
    );
  }
}
