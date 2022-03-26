library home_page;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pandorora_app/core/models/raffle.dart';
import 'package:pandorora_app/core/utils/locator_get_it.dart';
import 'package:pandorora_app/view/pages/home_page/bloc/pagination_bloc.dart';
import 'package:pandorora_app/view/widgets/components/app_bar_title.dart';

import '../../../core/navigation/navigation_manager.gr.dart';
import '../../constants/view_texts.dart';
import '../../widgets/components/custom_rounded_rectangle_card.dart';
import 'repo/filter_repository.dart';
import 'components/raffle_card/raffle_card.dart';
part 'components/home_filters/home_filters.dart';
part 'components/home_body.dart';
part 'components/more_button.dart';
part 'components/home_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: getIt<PaginationBloc>(),
        buildWhen: (previous, current) => previous != current,
        builder: (context, PaginationState state) =>
            _HomeBody(raffleList: state.raffles),
      ),
    );
  }
}
