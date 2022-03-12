part of home_body;

class _HomeListViewBuilder extends StatelessWidget {
  const _HomeListViewBuilder({
    Key? key,
    required this.raffleList,
  }) : super(key: key);
  final List<Raffle> raffleList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: raffleList.length,
      itemBuilder: (context, index) {
        final _currentRaffleCard = RaffleCard(raffle: raffleList[index]);
        // 0. indexte filtreler ve _raffleCard var;
        if (index == 0) {
          return Column(children: [const _HomeFilters(), _currentRaffleCard]);
        } else if (index >= raffleList.length - 1) {
          //son indexte _raffleCard ve MoreButton var;
          return Column(children: [_currentRaffleCard, const _MoreButton()]);
        }
        return _currentRaffleCard;
      },
    );
  }
}

class _MoreButton extends StatelessWidget {
  const _MoreButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = getIt<PaginationBloc>();
    return BlocBuilder(
      bloc: _bloc,
      builder: (context, PaginationState state) {
        if (state.status == PaginationStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return TextButton(
            onPressed: () {
              if (getIt<TagList>().filters.isNotEmpty) {
                _bloc.add(PaginationFilteredPatch(getIt<TagList>().filters));
              } else {
                _bloc.add(const PaginationAllFetched());
              }
            },
            child: const Text('Daha fazla'),
          );
        }
      },
    );
  }
}
