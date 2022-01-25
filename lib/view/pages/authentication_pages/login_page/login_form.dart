import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pandorora_app/view/widgets/widget_consts.dart';
import '../../../widgets/_/_cutom_text_form_field.dart';
import '../../../widgets/_/_print_message.dart';
import '../../../../feature/global_view_models/auth/auth_bloc.dart';

import '../../../../core/constants/navigation_consts.dart';

import '../../../constants/view_texts.dart';

import 'cubit/loginpage_cubit.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  final _transparentDivider = WC.tpDivider;
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
      child: form(_loginpageCubit),
    );
  }

  Form form(LoginpageCubit _loginpageCubit) {
    return Form(
      key: _loginpageCubit.formKey,
      child: WC.paddingAll(
        child: Center(
          child: Column(
            children: [
              _Head(),
              _transparentDivider,
              CustomTextFormField(
                controller: _loginpageCubit.mailController,
              ),
              _transparentDivider,
              CustomTextFormField(
                controller: _loginpageCubit.passwordController,
              ),
              _transparentDivider,
              _SignInButton(
                loginpageCubit: _loginpageCubit,
              ),
              _transparentDivider,
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
          LoginPageText.LOGIN_TITLE,
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
                  : () => loginpageCubit.formKey.currentState!.validate() ==
                          true
                      ? loginpageCubit.signIn().then((value) =>
                          context.read<AuthBloc>().add(AuthTryGetCurrentUser()))
                      : null,
              child: const Text(LoginPageText.SIGN_IN));
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
        child: const Text(LoginPageText.SIGN_UP));
  }
}
