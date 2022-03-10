part of home_body;

class _HomeFilters extends StatelessWidget {
  const _HomeFilters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ExpansionTile(
        title: const Text('Filtreler'),
        children: <Widget>[
          Wrap(
            children: TagList.tags.map((e) => _TagCard(e)).toList(),
          ),
          TextButton.icon(
              onPressed: () {
                context
                    .read<HomeBloc>()
                    .add(HomeFilteredFetched(getIt<TagList>().filters));
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
    this.tagName, {
    Key? key,
  }) : super(key: key);
  final String tagName;

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
          getIt<TagList>().filters.add(widget.tagName);
        },
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            widget.tagName,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
