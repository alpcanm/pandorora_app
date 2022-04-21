part of home_page;

class _HomeFilters extends StatelessWidget {
  const _HomeFilters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GridView(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          children: FilterRepository.tags.keys
              .map((key) => _TagCard(
                    FilterRepository.tags[key] ?? "",
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
    final _filterRepo = getIt<FilterRepository>();
    bool _isSelected = false;
    for (String element in _filterRepo.filters) {
      if (element == widget.tagKey) {
        _isSelected = true;
      }
    }
    return Card(
      color: _isSelected ? Colors.white70 : Colors.white,
      child: InkWell(
        onTap: () {
          bool _isInThere = false;
          for (String element in _filterRepo.filters) {
            if (element == widget.tagKey) {
              _isInThere = true;
            }
          }
          if (_isInThere) {
            _filterRepo.filters.remove(widget.tagKey);
          } else {
            _filterRepo.filters.add(widget.tagKey);
          }
          setState(() {});
        },
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: SvgPicture.asset(
                  FilterRepository.tagIcons[widget.tagKey] ?? "",
                  semanticsLabel: 'Acme Logo',
                  color: FilterRepository.tagColors[widget.tagKey],
                  height: heightChecker),
            ),
            Expanded(
              child: Text(
                widget.tagValue,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.blueGrey, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double get heightChecker => widget.tagKey == "kirtasiye" || widget.tagKey == "hediyelik"
      ? 30
      : widget.tagKey == "kozmetik"
          ? 40
          : 50;
}
