import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/navigation_consts.dart';
import '../../../core/utils/locator_get_it.dart';
import '../../widgets/components/log_out_button.dart';
import '_components/_expansion_tile.dart';
import '_components/_text_button.dart';
import 'bloc/profilepage_bloc.dart';

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

  final _button = ProfilePageButton();
  @override
  Widget build(BuildContext context) {
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
                    RouteConsts.VERIFY_PHONE_PAGE)),
        _button.iconButton(
            text: 'Contact us',
            icon: Icons.chat,
            onPressed: () => context.router.navigateNamed(
                RouteConsts.PROFILE_PAGE + "/" + RouteConsts.CONTACT_US_PAGE)),
   
        LogOutButton()
      ],
    );
  }
}
