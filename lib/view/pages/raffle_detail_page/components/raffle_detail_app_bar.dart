part of raffle_detail_page;

class _RaffleDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _RaffleDetailAppBar(
    this.context, {
    Key? key,
  }) : super(key: key);
  final BuildContext context;
  @override
  Size get preferredSize =>
      const Size.fromHeight(ConstSize.appBarpreferredSize);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: RoundedRectangleCardIcon(
        iconData: Icons.arrow_back_ios_new,
        onPressed: () {
          context.router.pop(context);
        },
      ),
    );
  }
}
