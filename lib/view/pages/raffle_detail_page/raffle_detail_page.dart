library raffle_detail_page;

import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pandorora_app/core/extension/context_extension.dart';
import 'package:pandorora_app/feature/repositories/global_repository.dart';

import 'package:pandorora_app/view/constants/consts_size.dart';

import '../../../core/models/raffle.dart';
import '../../../core/utils/locator_get_it.dart';

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
