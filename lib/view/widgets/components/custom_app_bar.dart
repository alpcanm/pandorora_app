import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/navigation/navigation_manager.gr.dart';
import '../../../core/utils/locator_get_it.dart';
import '../../../feature/repositories/auth_repository.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
    this.context, {
    Key? key,
  }) : super(key: key);
  final BuildContext context;
  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: IconButton(
        icon: const Icon(Icons.home),
        onPressed: () {
          context.router.replace(const HomeRoute());
        },
      ),
      actions: [
        IconButton(
          onPressed: () => context.router.replace(const ProfileRoute()),
          icon: const Icon(
            Icons.person,
          ),
          splashRadius: 18,
        ),
        IconButton(
          onPressed: () => getIt<AuthRepository>().signOut().then((value) =>
              context.router.replaceAll([const AuthControllerRoute()])),
          icon: const Icon(
            Icons.exit_to_app,
          ),
          splashRadius: 18,
        )
      ],
    );
  }
}
