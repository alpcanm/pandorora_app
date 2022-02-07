import 'package:flutter/material.dart';
import 'package:pandorora_app/core/models/product.dart';
import 'package:pandorora_app/view/pages/home_page/bloc/product_bloc.dart';
import 'components/product_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state.status == ProductStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return const _LitViewBuilder();
      },
    );
  }
}

class _LitViewBuilder extends StatelessWidget {
  const _LitViewBuilder({Key? key}) : super(key: key);
  Center get filters => const Center(child: Text('Filtreler'));
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final _product = Product(
          comment: "Açıklama",
          drawDate: DateTime(2022, 2, 28,),
          isApplied: index % 2 == 0 ? true : false,
          isExpired: false,
          photoURL: imageURL,
          productId: "516516546514",
          title: "Razer Mouse",
          tag: "#Mutfak malzemesi",
        );

        if (index == 0) {
          return filters;
        }
        return ProductCard(product: _product);
      },
      itemCount: 9,
    );
  }
}

String imageURL =
    'https://images.unsplash.com/photo-1481349518771-20055b2a7b24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2139&q=80';
