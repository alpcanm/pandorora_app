part of home_page;

class _HomeSliver extends StatelessWidget {
  _HomeSliver({
    Key? key,
    required this.raffleList,
  }) : super(key: key);
  final List<Raffle> raffleList;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _HomeAppBarr(
          insert: _insert,
          remove: _remove,
        ),
        SliverAnimatedList(
          key: _listKey,
          initialItemCount: _list.length,
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

  final _listKey = GlobalKey<SliverAnimatedListState>();

  final List<int> _list = [];
  final int index = 0;
  void _insert() {
    _listKey.currentState!.insertItem(index);
    _list.insert(index, index);
  }

  void _remove() {
    _list.removeAt(index);
    _listKey.currentState!.removeItem(
        index,
        (context, animation) => SizeTransition(
              sizeFactor: animation,
              axis: Axis.vertical,
              child: const _HomeFilters(),
            ));
  }
}
