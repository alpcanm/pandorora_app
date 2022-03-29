import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pandorora_app/view/constants/consts_size.dart';

import '../../../widgets/components/custom_rounded_rectangle_card.dart';

class ProfileChildAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProfileChildAppBar(
    this.context, {
    Key? key,
  }) : super(key: key);
  final BuildContext context;
  @override
  Size get preferredSize => const Size.fromHeight(ConstSize.appBarpreferredSize);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: RoundedRectangleCardIcon(
        iconData: Icons.arrow_back_ios_new,
        onPressed: () {
          context.router.pop(context);
        },
      ),
    );
  }
}
