import 'package:auto_route/auto_route.dart';
import '../../view/pages/raffle_page/raffle_page.dart';
import '../../view/pages/my_raffles_page/my_raffles_page.dart';

import '../../view/pages/profile_page/children_pages/phone_verify_page/phone_verify_page.dart';

import '../../view/pages/profile_page/children_pages/change_password/change_password_page.dart';

import '../../view/pages/profile_page/children_pages/contact_us/contact_us_page.dart';

import '../../view/pages/profile_page/children_pages/update_profile/update_profile_page.dart';
import '../../view/pages/home_page/home_page.dart';
import '../../view/pages/splash_page/splash_body.dart';
import '../../view/pages/splash_page/splash_page.dart';
import '../constants/navigation_consts.dart';
import 'auth_guard.dart';
import '../../view/pages/authentication_pages/login_page/login_page.dart';
import '../../view/pages/authentication_pages/not_login_page.dart';
import '../../view/pages/authentication_pages/register_page/register_page.dart';
import '../../view/pages/profile_page/profile_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, path: RouteConsts.SPLASH_PAGE),
    AutoRoute(
        page: EmptyRouterPage,
        path: RouteConsts.PROFILE_PAGE,
        name: RouteConsts.PROFILE_MAIN_ROUTE,
        guards: [
          AuthGuard
        ],
        children: [
          AutoRoute(page: ProfilePage, path: ''),
          AutoRoute(
              page: UpdateProfilePage, path: RouteConsts.UPDATE_PROFILE_PAGE),
          AutoRoute(page: ContactUsPage, path: RouteConsts.CONTACT_US_PAGE),
          AutoRoute(
              page: ChangePasswordPage, path: RouteConsts.CHANGE_PASSWORD_PAGE),
          AutoRoute(page: PhoneVerifyPage, path: RouteConsts.VERIFY_PHONE_PAGE)
        ]),
    AutoRoute(
        page: HomePage,
        name: RouteConsts.HOME_MAIN_ROUTE,
        path: RouteConsts.HOME_PAGE,
        guards: [AuthGuard]),
    AutoRoute(page: RafflePage, path: RouteConsts.RAFFLE_PAGE),
    AutoRoute(
        page: MyRafflesPage, path: RouteConsts.CONSOLE_PAGE, guards: [AuthGuard]),
    AutoRoute(
        page: AuthController,
        path: RouteConsts.CONTROLLER_PAGE,
        name: RouteConsts.AUTH_CONTROLLER_ROUTE),
    AutoRoute(page: LoginPage, path: RouteConsts.LOGIN_PAGE),
    AutoRoute(page: NotLoginPage, path: RouteConsts.NOT_LOGIN_PAGE),
    AutoRoute(page: RegisterPage, path: RouteConsts.REGISTER_PAGE),
  ],
)
class $AppRouter {}
