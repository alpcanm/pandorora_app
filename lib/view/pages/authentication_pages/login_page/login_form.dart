import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pandorora_app/view/widgets/_print_message.dart';

import '../../../../core/constants/navigation_consts.dart';

import '../../../constants/view_texts.dart';
import '../../../widgets/_cutom_text_form_field.dart';
import 'cubit/loginpage_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _loginpageCubit = context.read<LoginpageCubit>();
    return BlocListener<LoginpageCubit, LoginpageState>(
      listenWhen: (previous, current) => current is LoginpageError,
      listener: (context, state) {
        if (state is LoginpageError) {
          PrintMessage.showFailed(context, state.errorMessage);
        }
      },
      child: Form(
        key: _loginpageCubit.formKey,
        child: Center(
          child: Column(
            children: [
              _Head(),
              CustomTextFormField(
                controller: _loginpageCubit.mailController,
              ),
              CustomTextFormField(
                controller: _loginpageCubit.passwordController,
              ),
              _SignInButton(
                loginpageCubit: _loginpageCubit,
              ),
              _SignUpButton()
            ],
          ),
        ),
      ),
    );
  }
}

class _Head extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const FlutterLogo(
          size: 72,
        ),
        Text(
          ViewText.LOGIN_TITLE,
          style: Theme.of(context).textTheme.headline4,
        )
      ],
    );
  }
}

class _SignInButton extends StatelessWidget {
  final LoginpageCubit loginpageCubit;

  const _SignInButton({
    Key? key,
    required this.loginpageCubit,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginpageCubit, LoginpageState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is LoginpageLoading) {
          return const CircularProgressIndicator();
        } else {
          return ElevatedButton(
              onPressed: state
                      is LoginpageCompleted // Giriş başarılıysa buton pasife düşecek.
                  ? null
                  : () =>
                      loginpageCubit.formKey.currentState!.validate() == true
                          ? loginpageCubit.signIn()
                          : null,
              child: Text(ViewText.SIGN_IN));
        }
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () =>
            context.router.navigateNamed(RouteConsts.REGISTER_PAGE),
        child: Text(ViewText.SIGN_UP));
  }
}
