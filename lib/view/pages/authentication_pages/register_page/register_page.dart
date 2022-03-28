library register_page;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/navigation/navigation_manager.gr.dart';
import '../../../widgets/components/custom_rounded_rectangle_card.dart';
import 'cubit/registerpage_cubit.dart';
import 'register_form.dart';

part 'components/register_app_bar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _RegisterAppBar(),
      body: BlocProvider(
        create: (context) => RegisterpageCubit(),
        child: const RegisterForm(),
      ),
    );
  }
}
