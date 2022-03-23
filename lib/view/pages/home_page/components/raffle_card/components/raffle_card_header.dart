part of raffle_card;

class _RaffleCardHeader extends StatelessWidget {
  const _RaffleCardHeader({
    Key? key,
    required this.raffle,
  }) : super(key: key);
  final Raffle raffle;
  @override
  Widget build(BuildContext context) {
    final _isActive = RaffleChecker.checker(raffle.raffleId!);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(raffle.tag ?? "",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                  shadows: const [
                    Shadow(
                        // bottomLeft
                        offset: Offset(-1.5, -1.5),
                        color: Colors.white),
                    Shadow(
                        // bottomRight
                        offset: Offset(1.5, -1.5),
                        color: Colors.white),
                    Shadow(
                        // topRight
                        offset: Offset(1.5, 1.5),
                        color: Colors.white),
                    Shadow(
                        // topLeft
                        offset: Offset(-1.5, 1.5),
                        color: Colors.white),
                  ],
                )),
            Text(_isActive ? "Katıldın" : "",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                  shadows: const [
                    Shadow(
                        // bottomLeft
                        offset: Offset(-1.5, -1.5),
                        color: Colors.white),
                    Shadow(
                        // bottomRight
                        offset: Offset(1.5, -1.5),
                        color: Colors.white),
                    Shadow(
                        // topRight
                        offset: Offset(1.5, 1.5),
                        color: Colors.white),
                    Shadow(
                        // topLeft
                        offset: Offset(-1.5, 1.5),
                        color: Colors.white),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
