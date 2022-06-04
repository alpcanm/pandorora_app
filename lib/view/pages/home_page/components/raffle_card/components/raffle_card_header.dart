part of raffle_card;

class _RaffleCardHeader extends StatelessWidget {
  const _RaffleCardHeader({
    Key? key,
    required this.raffle,
  }) : super(key: key);
  final Raffle raffle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("#${FilterRepository.tags[raffle.tag]}",
              style: Theme.of(context).textTheme.headline6!.copyWith()),
        ],
      ),
    );
  }
}
