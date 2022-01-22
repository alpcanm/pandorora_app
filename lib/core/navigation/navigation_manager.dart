import 'package:auto_route/auto_route.dart';
import '../constants/navigation_consts.dart';
import 'auth_guard.dart';
import '../../view/pages/authentication_pages/login_page/login_page.dart';
import '../../view/pages/authentication_pages/not_login_page.dart';
import '../../view/pages/authentication_pages/register_page/register_page.dart';
import '../../view/pages/home_page/home_page.dart';
import '../../view/pages/profile_page/profile_page.dart';
import '../../view/pages/splash_page/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, path: RouteConsts.INIT),
    AutoRoute(page: LoginPage, path: RouteConsts.LOGIN_PAGE),
    AutoRoute(page: HomePage, path: RouteConsts.HOME_PAGE, guards: [AuthGuard]),
    AutoRoute(
        page: ProfilePage, path: RouteConsts.PROFILE_PAGE, guards: [AuthGuard]),
    AutoRoute(page: NotLoginPage, path: RouteConsts.NOT_LOGIN_PAGE),
    AutoRoute(page: RegisterPage, path: RouteConsts.REGISTER_PAGE),
  ],
)
class $AppRouter {}
