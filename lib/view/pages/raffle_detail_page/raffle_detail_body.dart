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
        Row(
          children: [
            SizedBox(
              width: context.height * 0.1,
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.unarchive,
                  size: 36,
                  color: Theme.of(context).primaryColor,
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  primary: Colors.yellow,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
