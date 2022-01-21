import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pandorora_app/core/navigation/auth_guard.dart';
import 'package:pandorora_app/core/utils/locator_get_it.dart';
import 'package:pandorora_app/feature/repositories/init_repository.dart';
import 'core/navigation/navigation_manager.gr.dart';

main() async {
  setupGetIt();
  await getIt<InitRepository>().getFirebaseApiKey();
  runApp(PandororaApp());
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
