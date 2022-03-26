part of home_page;

class _HomeBody extends StatelessWidget {
  _HomeBody({
    Key? key,
    required this.raffleList,
  }) : super(key: key);
  final List<Raffle> raffleList;

  final _filterREpo = getIt<FilterRepository>();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const _HomeAppBarr(),
        SliverAnimatedList(
          key: _filterREpo.animatedSliverKey,
          initialItemCount: _filterREpo.filterShowList.length,
          itemBuilder:
              (BuildContext context, int index, Animation<double> animation) {
            return SizeTransition(
              sizeFactor: animation,
              axis: Axis.vertical,
              child: const _HomeFilters(),
            );
          },
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) =>
                RaffleCard(raffle: raffleList[index]),
            childCount: raffleList.length,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            child: _MoreButton(),
          ),
        ),
      ],
    );
  }
}
