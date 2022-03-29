part of home_page;

class _HomeAppBarr extends StatefulWidget {
  const _HomeAppBarr({
    Key? key,
  }) : super(key: key);

  @override
  State<_HomeAppBarr> createState() => _HomeAppBarrState();
}

class _HomeAppBarrState extends State<_HomeAppBarr> {
  final _filterREpo = getIt<FilterRepository>();
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: RoundedRectangleCardIcon(
        color: _filterREpo.isTagListOpen ? null : Colors.grey,
        iconData: Icons.tune,
        onPressed: () {
          _filterREpo.isTagListOpen
              ? _filterREpo.remove(
                  const _HomeFilters(), // Kapanırken gösterilecek widget DÜZELTİLMELİ
                )
              : _filterREpo.insert();
          setState(() {
            _filterREpo.isTagListOpen = !_filterREpo.isTagListOpen;
          });
        },
      ),
      centerTitle: true,
      title: const AppBarTitle(titleText: LoginPageText.LOGIN_TITLE),
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
