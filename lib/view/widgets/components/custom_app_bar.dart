import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pandorora_app/view/pages/home_page/components/home_filters/tag_list.dart';

import '../../../core/navigation/navigation_manager.gr.dart';
import '../../../core/utils/locator_get_it.dart';
import '../../pages/home_page/bloc/pagination_bloc.dart';

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
          onPressed: () => context.router.replace(const MyRafflesRoute()),
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
