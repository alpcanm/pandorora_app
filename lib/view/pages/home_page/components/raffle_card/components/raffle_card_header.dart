part of raffle_card;

class _RaffleCardHeader extends StatelessWidget {
  const _RaffleCardHeader({
    Key? key,
    required this.raffle,
  }) : super(key: key);
  final Raffle raffle;
  @override
  Widget build(BuildContext context) {
   
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("#${raffle.tag}",
                style: Theme.of(context).textTheme.headline6!.copyWith()),
            
          ],
        ),
      ),
    );
  }
}
