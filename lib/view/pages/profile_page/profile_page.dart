library profile_page;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:pandorora_app/feature/repositories/global_repository.dart';

import '../../../core/constants/navigation_consts.dart';
import '../../../core/navigation/navigation_manager.gr.dart';
import '../../../core/utils/locator_get_it.dart';
import '../../constants/view_texts.dart';
import '../../widgets/components/app_bar_title.dart';
import '../../widgets/components/custom_rounded_rectangle_card.dart';
import '../../widgets/components/log_out_button.dart';

part 'profile_body.dart';
part '_components/profile_page_button.dart';
part '_components/profile_list_tile.dart';
part '_components/profile_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(context),
      body: const ProfileBody(),
    );
  }
}
