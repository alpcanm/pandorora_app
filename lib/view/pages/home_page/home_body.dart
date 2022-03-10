library home_body;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pandorora_app/core/models/product.dart';
import 'package:pandorora_app/core/utils/locator_get_it.dart';
import 'package:pandorora_app/view/pages/home_page/bloc/home_bloc.dart';

import 'components/home_filters/tag_list.dart';
import 'components/product_card/product_card.dart';
part 'components/home_listview_builder.dart';
part 'components/home_filters/home_filters.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        // print(state);
        if (state.status == HomeStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return _HomeListViewBuilder(productList: state.products);
      },
    );
  }
}
