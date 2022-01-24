import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pandorora_app/core/navigation/navigation_manager.gr.dart';
import 'package:pandorora_app/core/utils/locator_get_it.dart';

import 'package:pandorora_app/feature/repositories/auth_repository.dart';
import 'package:pandorora_app/feature/repositories/global_repository.dart';
import 'package:auto_route/auto_route.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                getIt<AuthRepository>().signOut().then(
                    (value) => context.router.replaceAll([const AuthControllerRoute()]));
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Text(getIt<GlobalRepository>().user?.uid ?? "boş"),
    );
  }
}
