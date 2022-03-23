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
        title: Text(
          'Details',
          style: Theme.of(context).textTheme.headline6,
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
