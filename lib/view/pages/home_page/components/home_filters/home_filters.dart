part of home_page;

class _HomeFilters extends StatelessWidget {
  const _HomeFilters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Wrap(
          children: FilterRepository.tags.keys
              .map((key) => _TagCard(
                    FilterRepository.tags[key],
                    key,
                  ))
              .toList(),
        ),
        TextButton.icon(
            onPressed: () {
              final _filterREpo = getIt<FilterRepository>();
              final _bloc = getIt<PaginationBloc>();
              _filterREpo.remove(const _HomeFilters());
              _filterREpo.isTagListOpen = false;
              _bloc.add(
                PaginationAllFetched(
                    filters: getIt<FilterRepository>().filters,
                    status: PaginationStatus.initial),
              );
            },
            icon: const Icon(Icons.search),
            label: const Text('Ara'))
      ],
    );
  }
}

class _TagCard extends StatefulWidget {
  const _TagCard(
    this.tagValue,
    this.tagKey, {
    Key? key,
  }) : super(key: key);
  final String tagValue;
  final String tagKey;

  @override
  State<_TagCard> createState() => _TagCardState();
}

class _TagCardState extends State<_TagCard> {
  @override
  Widget build(BuildContext context) {
    bool _isSelected = false;
    for (String element in getIt<FilterRepository>().filters) {
      if (element == widget.tagKey) {
        _isSelected = true;
      }
    }
    return Card(
      color: _isSelected ? Theme.of(context).primaryColor : Colors.blueGrey,
      child: InkWell(
        onTap: () {
          bool _isInThere = false;
          for (String element in getIt<FilterRepository>().filters) {
            if (element == widget.tagKey) {
              _isInThere = true;
            }
          }
          if (_isInThere) {
            getIt<FilterRepository>().filters.remove(widget.tagKey);
          } else {
            getIt<FilterRepository>().filters.add(widget.tagKey);
          }
          setState(() {});
        },
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            widget.tagValue,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
