library splash_page;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/splash_cubit.dart';
import 'splash_body.dart';

part './components/no_internet_connection_screen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ConnectivityResult>(// Değiştirilebilir.
          stream: Connectivity().onConnectivityChanged,
          builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
            final _connectivityState = snapshot.data;

            if (_connectivityState == ConnectivityResult.none) {
              return const _NoInternetConnectionScreen();
            }
            return BlocProvider(
              create: (context) => SplashCubit(),
              child: const SplashBody(),
            );
          }),
    );
  }
}
