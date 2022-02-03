import 'package:flutter/material.dart';
import 'package:pandorora_app/view/pages/home_page/cubit/homepage_cubit.dart';
import 'components/product_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomepageCubit, HomepageState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is HomepageLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            if (index == 0) {
              return filters;
            }

            return const ProductCard();
          },
          itemCount: 9,
        );
      },
    );
  }

  Center get filters => const Center(child: Text('Filtreler'));
}
