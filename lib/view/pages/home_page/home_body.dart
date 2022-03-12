library home_body;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pandorora_app/core/models/raffle.dart';
import 'package:pandorora_app/core/utils/locator_get_it.dart';
import 'package:pandorora_app/view/pages/home_page/bloc/pagination_bloc.dart';

import 'components/home_filters/tag_list.dart';
import 'components/raffle_card/raffle_card.dart';
part 'components/home_listview_builder.dart';
part 'components/home_filters/home_filters.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: getIt<PaginationBloc>(),
      buildWhen: (previous, current) => previous != current,
      builder: (context, PaginationState state) {
        if (state.status == PaginationStatus.failure) {
          return const Center(child: Text("Veri yok"));
        }
        return _HomeListViewBuilder(raffleList: state.raffles);
      },
    );
  }
}
