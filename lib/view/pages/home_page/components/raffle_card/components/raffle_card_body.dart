part of raffle_card;

class _RaffleCardBody extends StatelessWidget {
  const _RaffleCardBody({
    Key? key,
    required this.raffle,
  }) : super(key: key);
  final Raffle raffle;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 16,
      child: Column(
        children: [
          _PhotoStack(raffle: raffle),
          _BottomCardStack(raffle: raffle),
        ],
      ),
    );
  }
}

class _PhotoStack extends StatelessWidget {
  const _PhotoStack({
    Key? key,
    required this.raffle,
  }) : super(key: key);

  final Raffle raffle;

  @override
  Widget build(BuildContext context) {
    const _borderRadius = BorderRadius.all(Radius.circular(15));
    return Expanded(
      flex: 4,
      child: Container(
        margin: const EdgeInsets.only(left: 1, right: 1, bottom: 8),
        child: ClipRRect(
          borderRadius: _borderRadius,
          child: Image.network(
            raffle.photoURL ?? "",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}

class _BottomCardStack extends StatelessWidget {
  const _BottomCardStack({
    Key? key,
    required this.raffle,
  }) : super(key: key);

  final Raffle raffle;

  @override
  Widget build(BuildContext context) {
    // final _isActive = RaffleChecker.checker(raffle.raffleId!);
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 18,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    raffle.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontSize: 16),
                  ),
                  // Text(_isActive ? "Katıldın" : "",
                  //     style: Theme.of(context).textTheme.headline6!.copyWith()),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: CountDownArea(
              dateTime: raffle.date!.toDate,
            ),
          )
        ],
      ),
    );
  }
}
