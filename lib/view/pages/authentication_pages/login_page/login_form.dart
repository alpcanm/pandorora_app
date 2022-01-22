import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'cubit/loginpage_cubit.dart';
import '../../../../core/navigation/navigation_manager.gr.dart';
import '../../../../feature/global_view_models/auth/auth_bloc.dart';
import '../../../../feature/repositories/auth_repository.dart';
import '../../../constants/view_texts.dart';
import '../../../widgets/_cutom_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _loginpageCubit = context.read<LoginpageCubit>();
    return Form(
      key: _loginpageCubit.formKey,
      child: Center(
        child: Column(
          children: [
            CustomTextFormField(
              controller: _loginpageCubit.mailController,
            ),
            CustomTextFormField(
              controller: _loginpageCubit.passwordController,
            ),
            _SignUpButton(
              loginpageCubit: _loginpageCubit,
            )
          ],
        ),
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  final LoginpageCubit loginpageCubit;
  const _SignUpButton({
    Key? key,
    required this.loginpageCubit,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          context.router.replace(const HomeRoute());
        }
      },
      child: BlocBuilder<LoginpageCubit, LoginpageState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return state == LoginpageLoading()
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () {
                    if (loginpageCubit.formKey.currentState!.validate()) {
                      loginpageCubit.signIn();
                    }
                  },
                  child: Text(ViewText.SIGN_IN));
        },
      ),
    );
  }
}
