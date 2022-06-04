import 'package:flutter/material.dart';
import '../../../core/utils/locator_get_it.dart';
import '../../../feature/repositories/raffle_repository.dart';
import '../../widgets/components/my_future_builder.dart';
import '../../../core/models/subscribed_raffles_model.dart';
import 'components/my_raffles_card.dart';

class MyRafflesBody extends StatelessWidget {
  MyRafflesBody({Key? key}) : super(key: key);
  final PageController _pageViewController = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    WidgetsBinding.instance?.addPostFrameCallback((_) {
                      if (_pageViewController.hasClients) {
                        _pageViewController.animateToPage(0, duration: const Duration(seconds: 1), curve: Curves.easeOutSine);
                      }
                    });
                  },
                  child: const Text("gelecek"),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    WidgetsBinding.instance?.addPostFrameCallback((_) {
                      if (_pageViewController.hasClients) {
                        _pageViewController.animateToPage(1, duration: const Duration(seconds: 1), curve: Curves.easeOutSine);
                      }
                    });
                    // if (_pageViewController.hasClients) {
                    //   _pageViewController.animateToPage(1, duration: const Duration(seconds: 1), curve: Curves.easeOutSine);
                    // }
                  },
                  child: const Text("geçmiş"),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 18,
          child: CustomFutureBuilder<SubscribedRafflesModel?>(
              future: getIt<RaffleRepository>().getSubscribedRaffles(),
              widget: (context, AsyncSnapshot<SubscribedRafflesModel?> snapshot) {
                return PageView(
                  controller: _pageViewController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    ListView.builder(
                      itemBuilder: (context, index) {
                        if (snapshot.data != null) {
                          return MyRafflesCard(snapshot.data!.futureRaffleList.elementAt(index));
                        }
                        return const SizedBox();
                      },
                      itemCount: snapshot.data!.futureRaffleList.length,
                      shrinkWrap: true,
                    ),
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return MyRafflesCard(snapshot.data!.pastRaffleList.elementAt(index));
                      },
                      itemCount: snapshot.data!.pastRaffleList.length,
                      shrinkWrap: true,
                    )
                  ],
                );
              }),
        ),
      ],
    );
  }
}
