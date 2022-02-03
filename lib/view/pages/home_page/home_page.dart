import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pandorora_app/view/pages/home_page/cubit/homepage_cubit.dart';

import '../../widgets/components/custom_app_bar.dart';
import 'home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context),
      body: BlocProvider(
        create: (context) => HomepageCubit(),
        child: const HomeBody(),
      ),
    );
  }
}
