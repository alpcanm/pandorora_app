import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pandorora_app/feature/global_view_models/auth/auth_bloc.dart';

import 'package:pandorora_app/feature/repositories/global_repository.dart';

import 'core/navigation/auth_guard.dart';
import 'core/navigation/navigation_manager.gr.dart';
import 'core/utils/locator_get_it.dart';

main() async {
  setupGetIt();
  await getIt<GlobalRepository>().getFirebaseApiKey();
  await getIt<GlobalRepository>().tokenInit();
  getIt<GlobalRepository>().authServiceInit();
  setupGetIt2();
  runApp(BlocProvider(
    create: (context) => AuthBloc(),
    child: PandororaApp(),
  ));
}

class PandororaApp extends StatelessWidget {
  PandororaApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter(authGuard: AuthGuard());
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: AutoRouterDelegate(
          _appRouter,
          initialRoutes: [const SplashRoute()],
        ));
  }
}
