import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pandorora_app/core/extension/int_extension.dart';

import '../../../../core/models/raffle.dart';
import '../../../widgets/_/count_down/count_down.dart';

import '../../../../core/navigation/navigation_manager.gr.dart';

class MyRafflesCard extends StatelessWidget {
  const MyRafflesCard(this.raffle, {Key? key}) : super(key: key);
  final Raffle raffle;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        onTap: (() {
          context.router.push(RaffleRoute(raffle: raffle));
        }),
        leading: Image.network(raffle.photoURL ?? ""),
        title: Text(raffle.title ?? ""),
        subtitle: Text(raffle.comment ?? "",
            maxLines: 1, overflow: TextOverflow.ellipsis),
        trailing: SizedBox(
            width: 100,
            child: CountDownArea(dateTime: raffle.date?.toDate ?? DateTime.now())),
      ),
    );
  }
}
