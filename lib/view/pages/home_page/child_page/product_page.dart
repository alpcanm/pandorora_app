import 'package:flutter/material.dart';
import 'package:pandorora_app/view/pages/home_page/components/product_card.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        //backgroundColor:  Colors.grey, Eğer katılmışsa gri renk olacak
        onPressed: () {},
        child: Text(
          'Katıl',
          style: TextStyle(color: Colors.yellow),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text(context.widget.toString()),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Çamaşır Deterjanı',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          SizedBox(
              width: _height,
              child: Stack(
                children: [
                  Image.network(imageURL),
                  Text(
                    'Copy ref Id',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              )),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'İzle',
                style: TextStyle(color: Colors.purple),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.yellow),
            ),
          )
        ],
      ),
    );
  }
}
