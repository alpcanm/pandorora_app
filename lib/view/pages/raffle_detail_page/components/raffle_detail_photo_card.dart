part of raffle_detail_page;

class _RaffleDetailPhotoCard extends StatelessWidget {
  const _RaffleDetailPhotoCard(this.photoUrl, {Key? key}) : super(key: key);
  final String photoUrl;
  @override
  Widget build(BuildContext context) {
    final _borderRadius = BorderRadius.circular(16.0);
    return ClipRRect(
      borderRadius: _borderRadius,
      child: Container(
        width: context.width * 0.9,
        height: context.height * 0.4,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(photoUrl),
        )),
      ),
    );
  }
}
