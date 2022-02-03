import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/search_bloc.dart';
import 'search_body.dart';
import '../../widgets/components/custom_app_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context),
      body: BlocProvider<SearchBloc>(
        create: (context) => SearchBloc(),
        child: const SearchBody(),
      ),
    );
  }
}
