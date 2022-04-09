part of raffle_detail_page;

class _RaffleDetailFAB extends StatelessWidget {
  const _RaffleDetailFAB(
    this.raffle, {
    Key? key,
  }) : super(key: key);
  final Raffle raffle;
  @override
  Widget build(BuildContext context) {
    final _globarRepo = getIt<GlobalRepository>();
    final _haveSubscribe = _globarRepo.checker(raffle.raffleId!);
    if (_globarRepo.user == null) {
      return signForJoin(context);
    } else {
      return _haveSubscribe == false
          ? joinRaffle(context)
          : watchRaffle(context);
    }
  }

  SlideAction joinRaffle(BuildContext context) {
    return SlideAction(
      alignment: Alignment.bottomCenter,
      onSubmit: () {},
      text: "Çekilişe katıl",
      innerColor: Theme.of(context).secondaryHeaderColor,
      outerColor: Theme.of(context).primaryColor,
    );
  }

  SlideAction signForJoin(BuildContext context) {
    return SlideAction(
      text: "Giriş yap",
      alignment: Alignment.bottomCenter,
      onSubmit: () {},
      outerColor: Theme.of(context).primaryColor,
    );
  }

  SlideAction watchRaffle(BuildContext context) {
    return SlideAction(
      text: "Çekiliş izle",
      reversed: true,
      alignment: Alignment.bottomCenter,
      onSubmit: () {},
      innerColor: Theme.of(context).primaryColor,
      outerColor: Theme.of(context).secondaryHeaderColor,
    );
  }
}
