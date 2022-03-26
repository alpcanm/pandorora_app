part of profile_page;

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar(
    this.context, {
    Key? key,
  }) : super(key: key);
  final BuildContext context;
  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: RoundedRectangleCardIcon(
        iconData: Icons.arrow_back_ios_new,
        onPressed: () {
          context.router.replace(const HomeMainRoute());
        },
      ),
      title: const AppBarTitle(titleText: LoginPageText.PROFILE_TITLE),
      centerTitle: true,
    );
  }
}
