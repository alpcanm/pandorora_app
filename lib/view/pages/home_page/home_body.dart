import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pandorora_app/core/models/product.dart';
import 'package:pandorora_app/view/pages/home_page/bloc/product_bloc.dart';

import 'components/home_card.dart';

String imageURL =
    'https://images.unsplash.com/photo-1481349518771-20055b2a7b24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2139&q=80';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state.status == HomeStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return const _LitViewBuilder();
      },
    );
  }
}

final _product = Product(
    comment: "Açıklama",
    drawDate: DateTime(2022, 2, 28),
    isExpired: false,
    photoURL: imageURL,
    productId: "516516546514",
    title: "Razer Mouse",
    tag: "#Mutfak malzemesi",
    drawURL: "asd");
List<Product> _listPRoduct = [
  _product,
  _product,
  _product,
  _product,
  _product,
  _product,
];

class _LitViewBuilder extends StatelessWidget {
  const _LitViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final _homeCard = HomeCard(product: _product);
        if (index == 0) {
          return Column(children: [filters, _homeCard]);
        } else if (index >= _listPRoduct.length - 1) {
          return TextButton(onPressed: () {}, child: const Text('Daha fazla'));
        }

        return _homeCard;
      },
      itemCount: _listPRoduct.length,
    );
  }

  Center get filters {
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
    ));
  }
}

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
