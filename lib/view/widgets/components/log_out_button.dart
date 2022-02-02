import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pandorora_app/core/navigation/navigation_manager.gr.dart';
import 'package:pandorora_app/core/utils/locator_get_it.dart';
import 'package:pandorora_app/feature/repositories/auth_repository.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => getIt<AuthRepository>().signOut().then(
          (value) => context.router.replaceAll([const AuthControllerRoute()])),
      icon: const Icon(
        Icons.exit_to_app,
      ),
      splashRadius: 18,
    );
  }
}
