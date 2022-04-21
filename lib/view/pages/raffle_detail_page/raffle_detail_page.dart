library raffle_detail_page;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pandorora_app/core/extension/context_extension.dart';
import 'package:pandorora_app/feature/repositories/global_repository.dart';

import 'package:pandorora_app/view/constants/consts_size.dart';
import 'package:pandorora_app/view/pages/raffle_detail_page/components/cubit/rewarded_ad_cubit.dart';
import 'package:pandorora_app/view/widgets/_/_print_message.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/models/mini_raffle_model.dart';
import '../../../core/models/raffle.dart';
import '../../../core/utils/locator_get_it.dart';

import '../../constants/const_font_name.dart';
import '../../widgets/components/custom_rounded_rectangle_card.dart';

import '../../widgets/components/swipe_button.dart';
part 'components/raffle_detail_fab.dart';
part 'components/raffle_detail_app_bar.dart';
part 'components/raffle_detail_photo_card.dart';
part 'components/raffle_detail_header.dart';
part 'raffle_detail_body.dart';

class RaffleDetailPage extends StatelessWidget {
  const RaffleDetailPage(Raffle raffle, {Key? key})
      : _raffle = raffle,
        super(key: key);
  final Raffle _raffle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _RaffleDetailFAB(_raffle),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: _RaffleDetailAppBar(context),
      body: _RaffleDetailBody(_raffle),

    );
  }
}
