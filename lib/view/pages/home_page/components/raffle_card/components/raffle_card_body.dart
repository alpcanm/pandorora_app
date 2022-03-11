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
      flex: 9,
      child: InkWell(
        onTap: () => context.router.push(RaffleRoute(raffle: raffle)),
        child: Stack(
          children: [
            _PhotoStack(raffle: raffle),
            _BottomCardStack(raffle: raffle),
          ],
        ),
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
    return Positioned.fill(
      child: Align(
        alignment: Alignment.topCenter,
        child: Image.network(
          raffle.photoURL ?? "",
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
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
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: context.height * 0.1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 15,
                    child: Center(
                      child: Text(
                        raffle.title ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 15,
                    child: CountDownArea(
                      dateTime: raffle.date!.toDate,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
