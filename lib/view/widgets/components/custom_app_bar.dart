import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/navigation/navigation_manager.gr.dart';

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
          context.router.replace(const HomeMainRoute());
        },
      ),
      actions: [
        IconButton(
          onPressed: () => context.router.replace(const ConsoleRoute()),
          icon: const Icon(
            Icons.now_widgets,
          ),
          splashRadius: 18,
        ),
        IconButton(
          onPressed: () => context.router.replace(const ProfileMainRoute()),
          icon: const Icon(
            Icons.person,
          ),
          splashRadius: 18,
        ),
      ],
    );
  }
}
