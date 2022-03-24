library profile_page;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/navigation_consts.dart';
import '../../../core/utils/locator_get_it.dart';
import '../../widgets/components/custom_app_bar.dart';
import '../../widgets/components/log_out_button.dart';
import 'bloc/profilepage_bloc.dart';

part 'profile_body.dart';
part '_components/profile_page_button.dart';
part '_components/profile_list_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context),
      body: const ProfileBody(),
    );
  }
}
