library raffle_detail_page;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pandorora_app/core/extension/context_extension.dart';

import 'package:pandorora_app/feature/repositories/raffle_repository.dart';
import 'package:pandorora_app/view/pages/home_page/bloc/pagination_bloc.dart';

import '../../../core/models/raffle.dart';
import '../../../core/utils/locator_get_it.dart';
import '../../widgets/components/custom_rounded_rectangle_card.dart';
import '../../widgets/components/raffle_checker.dart';
part 'components/raffle_detail_fab.dart';
part 'components/raffle_detail_app_bar.dart';
part 'components/raffle_detail_photo_card.dart';
part 'components/raffle_detail_header.dart';
part 'raffle_detail_body.dart';

class RafflePage extends StatelessWidget {
  const RafflePage(Raffle raffle, {Key? key})
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
