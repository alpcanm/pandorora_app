import 'package:flutter/material.dart';
import '../bloc/search_bloc.dart';
import '../../../widgets/_/_custom_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = context.read<SearchBloc>();

    return CustomTextFormField(controller: _bloc.searchController);
  }
}
