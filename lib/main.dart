import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'view/theme/_theme.dart';
import 'core/navigation/auth_guard.dart';
import 'core/navigation/navigation_manager.gr.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(PandororaApp());
}

class PandororaApp extends StatelessWidget {
  PandororaApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter(authGuard: AuthGuard());
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ToDoTheme.light(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: AutoRouterDelegate(
        _appRouter,
        initialRoutes: [
          const SplashRoute(),
        ],
      ),
    );
  }
}
