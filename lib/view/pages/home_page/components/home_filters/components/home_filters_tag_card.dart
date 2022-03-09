part of home_body;

class _TagCard extends StatefulWidget {
  const _TagCard(
    this.text, {
    Key? key,
  }) : super(key: key);
  final String text;

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
        },
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(
            widget.text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}