import 'package:flutter/material.dart';
import 'bloc/search_bloc.dart';
import 'components/search_box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = context.read<SearchBloc>();
    return Column(
      children: [SearchBox()],
    );
  }
}
