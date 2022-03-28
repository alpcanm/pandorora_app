part of register_page;

class _RegisterAppBar extends StatelessWidget implements PreferredSize {
  const _RegisterAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        // backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: RoundedRectangleCardIcon(
            iconData: Icons.arrow_back_ios_outlined,
            onPressed: () =>
                context.router.replaceAll([const AuthControllerRoute()])),
        title: Text(
          'Details',
          style: Theme.of(context).textTheme.headline5,
        ),

        actions: [],
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
