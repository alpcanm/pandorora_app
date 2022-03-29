part of raffle_detail_page;

class _RaffleDetailBody extends StatelessWidget {
  const _RaffleDetailBody(
    this.raffle, {
    Key? key,
  }) : super(key: key);
  final Raffle raffle;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _RaffleDetailHeader(raffle.title ?? ""),
        _RaffleDetailPhotoCard(raffle.photoURL ?? ""),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {},
            child: const Text(
              'İzle',
              style: TextStyle(color: Colors.purple),
            ),
            style: ElevatedButton.styleFrom(primary: Colors.yellow),
          ),
        )
      ],
    );
  }
}
