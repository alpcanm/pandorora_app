library raffle_card;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:pandorora_app/core/extension/context_extension.dart';
import 'package:pandorora_app/core/extension/int_extension.dart';
import 'package:pandorora_app/core/models/raffle.dart';
import 'package:pandorora_app/view/widgets/_/count_down/count_down.dart';

import '../../../../../core/navigation/navigation_manager.gr.dart';
import '../../../../../core/utils/locator_get_it.dart';
import '../../../../../feature/repositories/global_repository.dart';
import '../../repo/filter_repository.dart';

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
    const _shape = RoundedRectangleBorder(
      side: BorderSide(color: Colors.black38, width: 0.2),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    );

    final _height = context.height * 0.5;

    return Stack(
      children: [
        SizedBox(
          height: _height,
          child: Card(
            shape: _shape,
            margin: _cardMargin,
            child: GestureDetector(
              onTap: () =>
                  context.router.push(RaffleDetailRoute(raffle: _raffle)),
              child: Column(
                children: [
                  _RaffleCardHeader(raffle: _raffle),
                  _RaffleCardBody(raffle: _raffle),
                ],
              ),
            ),
          ),
        ),
        _TicketLogo(
          raffle: _raffle,
        )
      ],
    );
  }
}

class _TicketLogo extends StatelessWidget {
  const _TicketLogo({
    Key? key,
    required this.raffle,
  }) : super(key: key);
  final Raffle raffle;
  @override
  Widget build(BuildContext context) {
    final _subscribed = getIt<GlobalRepository>().checker(raffle.raffleId!);
    final _color = Theme.of(context).primaryColor;
    return Positioned(
      top: 9,
      right: 17,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _subscribed
              ? SvgPicture.asset(
                  "assets/icons/filled-ticket.svg",
                  semanticsLabel: 'Acme Logo',
                  color: _color,
                  height: 30,
                )
              : SvgPicture.asset(
                  "assets/icons/outlined-ticket.svg",
                  semanticsLabel: 'Acme Logo',
                  color: _color,
                  height: 30,
                ),
        ],
      ),
    );
  }
}
