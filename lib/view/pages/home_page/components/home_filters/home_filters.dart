part of home_body;

class _HomeFilters extends StatelessWidget {
  const _HomeFilters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ExpansionTile(
        onExpansionChanged: (value) {
          if (value == false) {
            getIt<TagList>().filters.clear();
          }
        },
        title: const Text('Filtreler'),
        children: <Widget>[
          Wrap(
            children: TagList.tags.keys
                .map((e) => _TagCard(
                      TagList.tags[e],
                      onPressed: () {
                        getIt<TagList>().filters.add(e);
                      },
                    ))
                .toList(),
          ),
          TextButton.icon(
              onPressed: () {
                final _bloc = context.read<PaginationBloc>();
                _bloc.add(PaginationSwtiched());
                _bloc.add(PaginationFilteredPatch(getIt<TagList>().filters));
              },
              icon: const Icon(Icons.search),
              label: const Text('Ara'))
        ],
      ),
    );
  }
}

class _TagCard extends StatefulWidget {
  const _TagCard(
    this.tagValue, {
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  final String tagValue;
  final Function onPressed;
  @override
  State<_TagCard> createState() => _TagCardState();
}

class _TagCardState extends State<_TagCard> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: _isSelected ? Colors.purple : Colors.blueGrey,
      child: InkWell(
        onTap: () {
          setState(() {
            _isSelected = !_isSelected;
          });
          widget.onPressed();
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
