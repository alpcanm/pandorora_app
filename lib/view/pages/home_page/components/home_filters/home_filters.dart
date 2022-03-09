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
            children: _tags.map((e) => _TagCard(e)).toList(),
          ),
          TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.search),
              label: const Text('Ara'))
        ],
      ),
    );
  }
}

List<String> _tags = [
  "Kozmetik, Kişisel bakım",
  "Elektronik/Teknolojik alet",
  "Gıda,mutfak",
  "Giyim",
  "Ev eşyası",
  "Kitap/Kırtasiye",
  "Müzik/Enstrüman",
  "Hediyelik",
  "Temel gıda",
];
