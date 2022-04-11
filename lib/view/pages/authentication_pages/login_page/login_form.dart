import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/navigation/navigation_manager.gr.dart';

import '../../../theme/decorations.dart';
import '../../../widgets/_/_print_message.dart';
import '../../../widgets/_/_validators.dart';

import '../../../widgets/_/_widget_consts.dart';

import '../../../../core/constants/navigation_consts.dart';

import '../../../constants/view_texts.dart';

import '../../../widgets/components/app_bar_title.dart';
import '../../splash_page/auth_bloc/auth_bloc.dart';
import 'cubit/loginpage_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
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
      child: Form(
        key: _loginpageCubit.formKey,
        child: WC.paddingAll(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                    child: AppBarTitle(titleText: LoginPageText.LOGIN_TITLE)),
                _transparentDivider,
                TextFormField(
                  validator: Validators.mailValidator,
                  controller: _loginpageCubit.mailController,
                  decoration: Decorations.inputDecoration(context, "Mail"),
                ),
                _transparentDivider,
                TextFormField(
                  obscureText: true,
                  validator: Validators.passwordValidator,
                  controller: _loginpageCubit.passwordController,
                  decoration: Decorations.inputDecoration(context, "Şifre"),
                ),
                const _CheckBox(),
                Row(
                  children: [
                    Expanded(
                      child: _SignInButton(
                        loginpageCubit: _loginpageCubit,
                      ),
                    ),
                    const VerticalDivider(),
                    Expanded(child: _SignUpButton())
                  ],
                ),
                _transparentDivider,
                GestureDetector(
                  onTap: () {
                    context.router
                        .navigateNamed(RouteConsts.RESET_PASSWORD_PAGE);
                  },
                  child: Text("Şifremi unuttum",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: Theme.of(context).primaryColor)),
                ),
                _transparentDivider,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.router.replaceNamed(RouteConsts.HOME_PAGE);
                      },
                      child: Text("Giriş yapmadan devam et",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  color: Theme.of(context).primaryColor)),
                    ),
                    _transparentDivider,
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CheckBox extends StatefulWidget {
  const _CheckBox({
    Key? key,
  }) : super(key: key);

  @override
  State<_CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<_CheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Giriş bilgilerini kaydet.",
        ),
        Checkbox(
          checkColor: Colors.white,
          value: context.read<LoginpageCubit>().isChecked,
          fillColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
          onChanged: (bool? value) {
            setState(() {
              context.read<LoginpageCubit>().isChecked = value!;
            });
          },
        ),
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
          return const Center(child: CircularProgressIndicator());
        } else {
          return ElevatedButton(
              onPressed: state
                      is LoginpageCompleted // Giriş başarılıysa buton pasife düşecek.
                  ? null
                  : () =>
                      loginpageCubit.formKey.currentState!.validate() == true
                          ? loginpageCubit
                              .signIn()
                              .then((value) => context
                                  .read<AuthBloc>()
                                  .add(AuthTryGetCurrentUser()))
                              .then((value) =>
                                  FocusManager.instance.primaryFocus?.unfocus())
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
    return TextButton(
        onPressed: () => context.router.replaceAll([const RegisterRoute()]),
        child: const Text(LoginPageText.SIGN_UP));
  }
}
