import 'package:flutter/material.dart';
import 'package:pandorora_app/view/widgets/_/_night_mode_switch.dart';
import '../../../core/constants/navigation_consts.dart';
import '../../../core/utils/locator_get_it.dart';
import '_components/_text_button.dart';
import 'package:auto_route/auto_route.dart';
import 'bloc/profilepage_bloc.dart';

import '_components/_expansion_tile.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  void dispose() {
    getIt<ProfilepageBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _button = ProfilePageButton();
    return ListView(
      children: [
        const ProfileExpansionTile(),
        _button.iconButton(
            text: 'Update profile',
            icon: Icons.person,
            onPressed: () => context.router.navigateNamed(
                RouteConsts.PROFILE_PAGE +
                    "/" +
                    RouteConsts.UPDATE_PROFILE_PAGE)),
        _button.iconButton(
            text: 'Change password',
            icon: Icons.password,
            onPressed: () => context.router.navigateNamed(
                RouteConsts.PROFILE_PAGE +
                    "/" +
                    RouteConsts.CHANGE_PASSWORD_PAGE)),
        _button.iconButton(
            text: 'Phone verify',
            icon: Icons.phone,
            onPressed: () => context.router.navigateNamed(
                RouteConsts.PROFILE_PAGE +
                    "/" +
                    RouteConsts.CHANGE_PHONE_NUMBER_PAGE)),
        _button.iconButton(
            text: 'Payment method',
            icon: Icons.payment,
            onPressed: () => context.router.navigateNamed(
                RouteConsts.PROFILE_PAGE +
                    "/" +
                    RouteConsts.PAYMENT_METHOD_PAGE)),
        _button.iconButton(
            text: 'Contact us',
            icon: Icons.chat,
            onPressed: () => context.router.navigateNamed(
                RouteConsts.PROFILE_PAGE + "/" + RouteConsts.CONTACT_US_PAGE)),
        const NightModeSwitch()
      ],
    );
  }
}
