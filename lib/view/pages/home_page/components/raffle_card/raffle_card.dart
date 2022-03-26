library raffle_card;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pandorora_app/core/extension/context_extension.dart';
import 'package:pandorora_app/core/extension/int_extension.dart';
import 'package:pandorora_app/core/models/raffle.dart';
import 'package:pandorora_app/view/widgets/_/count_down/count_down.dart';

import '../../../../../core/navigation/navigation_manager.gr.dart';
import '../../../../widgets/components/raffle_checker.dart';

part 'components/raffle_card_body.dart';
part 'components/raffle_card_header.dart';

class RaffleCard extends StatelessWidget {
  const RaffleCard({Key? key, required Raffle raffle})
      : _raffle = raffle,
        super(key: key);

  final Raffle _raffle;
  final _cardMargin = const EdgeInsets.only(left: 21, right: 21, top: 13);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.5,
      child: Card(
        margin: _cardMargin,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: GestureDetector(
          onTap: () => context.router.push(RaffleRoute(raffle: _raffle)),
          child: Column(
            children: [
              _RaffleCardHeader(raffle: _raffle),
              _RaffleCardBody(raffle: _raffle),
            ],
          ),
        ),
      ),
    );
  }
}
