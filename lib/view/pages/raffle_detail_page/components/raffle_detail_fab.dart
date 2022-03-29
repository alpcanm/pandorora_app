part of raffle_detail_page;

class _RaffleDetailFAB extends StatelessWidget {
  const _RaffleDetailFAB(
    this.raffle, {
    Key? key,
  }) : super(key: key);
  final Raffle raffle;
  @override
  Widget build(BuildContext context) {
    final _isActive = RaffleChecker.checker(raffle.raffleId!);
    return FloatingActionButton.extended(
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      backgroundColor: !_isActive == true ? Colors.grey : null,
      onPressed: _isActive
          ? null
          : () {
              getIt<RaffleRepository>()
                  .subscribeARaffle(raffle.raffleId!, raffle.date!)
                  .then((_) {
                getIt<RaffleRepository>().myRaffles().then((e) {
                  getIt<PaginationBloc>().add(const PaginationAllFetched(
                      status: PaginationStatus.initial));
                });
              });
            },
      label: SizedBox(
        width: context.width * 0.8,
        child: const Text('çekilişe katıl',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: ConstFontName.redHat,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
