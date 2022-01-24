import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/navigation/navigation_manager.gr.dart';
import 'package:auto_route/auto_route.dart';
import '../../../feature/global_view_models/auth/auth_bloc.dart';
import '../../../feature/repositories/auth_repository.dart';
import 'cubit/splash_cubit.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      buildWhen: (previous, current) => current != previous,
      builder: (context, state) {
        if (state is SplashInitial) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return _AuthController();
        }
      },
    );
  }
}

class _AuthController extends StatelessWidget {
  final _authBloc = AuthBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => _authBloc,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          switch (state.status) {
            case AuthStatus.authenticated:
              context.router
                  .replaceAll([AuthWrapperRoute(authBloc: _authBloc)]);
              break;
            case AuthStatus.unauthenticated:
              context.router.navigate(LoginRoute());
              break;
            default:
          }
        },
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
