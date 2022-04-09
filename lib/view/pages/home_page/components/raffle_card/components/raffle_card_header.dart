part of raffle_card;

class _RaffleCardHeader extends StatelessWidget {
  const _RaffleCardHeader({
    Key? key,
    required this.raffle,
  }) : super(key: key);
  final Raffle raffle;
  @override
  Widget build(BuildContext context) {
    final _subscribed = getIt<GlobalRepository>().checker(raffle.raffleId!);
    final _color = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("#${FilterRepository.tags[raffle.tag]}",
              style: Theme.of(context).textTheme.headline6!.copyWith()),
          _subscribed
              ? Icon(
                  Icons.audiotrack,
                  color: _color,
                )
              : Icon(
                  Icons.audiotrack_outlined,
                  color: _color,
                )
        ],
      ),
    );
  }
}
