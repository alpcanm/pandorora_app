import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pandorora_app/view/theme/_theme.dart';

import 'core/navigation/auth_guard.dart';
import 'core/navigation/navigation_manager.gr.dart';

main() {
  runApp(PandororaApp());
}

class PandororaApp extends StatelessWidget {
  PandororaApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter(authGuard: AuthGuard());
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        theme: ToDoTheme.light(),
        debugShowCheckedModeBanner: false,
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: AutoRouterDelegate(_appRouter,
            initialRoutes: [const SplashRoute()]));
  }
}
