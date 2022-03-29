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
    return FloatingActionButton(
      backgroundColor: _isActive == true ? Colors.grey : null,
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
      child: const Text(
        'Katıl',
        style: TextStyle(color: Colors.yellow),
      ),
    );
  }
}
