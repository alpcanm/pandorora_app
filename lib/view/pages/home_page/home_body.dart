import 'package:flutter/material.dart';
import 'package:pandorora_app/view/pages/home_page/components/custom_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _HomeCards();
  }
}

class _HomeCards extends StatelessWidget {
  const _HomeCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height * 0.5;
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const Center(child: Text('Filtreler'));
        }
        return SizedBox(height: _height, child: const CustomCard());
      },
      itemCount: 9,
    );
  }
}
