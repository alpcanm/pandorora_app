library register_page;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
