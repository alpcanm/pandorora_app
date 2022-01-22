import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/loginpage_cubit.dart';
import 'login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginpageCubit = LoginpageCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider(
        create: (context) => _loginpageCubit,
        child: const LoginForm(),
      ),
    );
  }

  @override
  void dispose() {
    _loginpageCubit.close();
    super.dispose();
  }
}

  // Row head(BuildContext context) {
  //   return Row(
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       const FlutterLogo(
  //         size: 72,
  //       ),
  //       Text(
  //         ViewText.LOGIN_TITLE,
  //         style: Theme.of(context).textTheme.headline4,
  //       )
  //     ],
  //   );
  // }

  // BlocListener<AuthBloc, AuthState> signInButton(
  //     LoginpageCubit loginpageCubit, BuildContext context) {
  //   return BlocListener<AuthBloc, AuthState>(
  //     listenWhen: (previous, current) => previous.status != current.status,
  //     listener: (context, state) {
  //       if (state.status == AuthStatus.authenticated) {
  //         context.router.replace(const HomeRoute());
  //       }
  //     },
  //     child: ElevatedButton(
  //         onPressed: () {
  //           if (loginpageCubit.formKey.currentState!.validate()) {
  //             context.read<AuthBloc>().add(AuthLoginRequested(
  //                 loginpageCubit.mailController.text,
  //                 loginpageCubit.passwordController.text));
  //           }
  //         },
  //         child: Text(ViewText.SIGN_IN)),
  //   );
  // }

  // ElevatedButton signUpButton(BuildContext context) {
  //   return ElevatedButton(
  //       onPressed: () =>
  //           context.router.navigateNamed(RouteConsts.REGISTER_PAGE),
  //       child: Text(ViewText.SIGN_UP));
  // }