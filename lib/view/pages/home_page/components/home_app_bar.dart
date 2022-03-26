part of home_page;

class _HomeAppBarr extends StatefulWidget {
  const _HomeAppBarr({
    Key? key,
    required this.insert,
    required this.remove,
  }) : super(key: key);
  final VoidCallback insert;
  final VoidCallback remove;

  @override
  State<_HomeAppBarr> createState() => _HomeAppBarrState();
}

class _HomeAppBarrState extends State<_HomeAppBarr> {
  bool _filterIsActive = false;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: RoundedRectangleCardIcon(
        color: _filterIsActive ? null : Colors.grey,
        iconData: Icons.tune,
        onPressed: () {
          _filterIsActive ? widget.remove.call() : widget.insert.call();
          setState(() {
            _filterIsActive = !_filterIsActive;
          });
        },
      ),
      title: _Head(),
      backgroundColor: Colors.transparent,
      actions: [
        RoundedRectangleCardIcon(
          iconData: Icons.person,
          onPressed: () {
            context.router.replace(const ProfileMainRoute());
          },
        )
      ],
    );
  }
}

class _Head extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        LoginPageText.LOGIN_TITLE,
        style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 28),
      ),
    );
  }
}
