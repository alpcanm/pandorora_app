import 'package:flutter/material.dart';

import '../../../core/models/raffle.dart';
import '../../widgets/components/applied_checker.dart';

class RafflePage extends StatelessWidget {
  const RafflePage(Raffle raffle, {Key? key})
      : _raffle = raffle,
        super(key: key);
  final Raffle _raffle;
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.width;
    bool _isApplied = Checker.applyCheck(_raffle.raffleId ?? "");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: _isApplied == true ? Colors.grey : null,
        onPressed: _isApplied ? null : () {},
        child: const Text(
          'Katıl',
          style: TextStyle(color: Colors.yellow),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text(context.widget.toString()),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _raffle.title ?? "",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          SizedBox(
              width: _height,
              child: Stack(
                children: [
                  Image.network(_raffle.photoURL ?? ""),
                  Text(
                    'Ref: ${_raffle.raffleId}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              )),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'İzle',
                style: TextStyle(color: Colors.purple),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.yellow),
            ),
          )
        ],
      ),
    );
  }
}