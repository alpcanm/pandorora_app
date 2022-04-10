// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i16;

import '../../view/pages/authentication_pages/login_page/login_page.dart'
    as _i7;
import '../../view/pages/authentication_pages/register_page/register_page.dart'
    as _i8;
import '../../view/pages/home_page/home_page.dart' as _i3;
import '../../view/pages/my_raffles_page/my_raffles_page.dart' as _i5;
import '../../view/pages/profile_page/children_pages/change_password/change_password_page.dart'
    as _i12;
import '../../view/pages/profile_page/children_pages/change_raflle_nick_name/change_raffle_nick_name_page.dart'
    as _i14;
import '../../view/pages/profile_page/children_pages/contact_us/contact_us_page.dart'
    as _i10;
import '../../view/pages/profile_page/children_pages/mail_verify/mail_verify_page.dart'
    as _i15;
import '../../view/pages/profile_page/children_pages/phone_verify_page/phone_verify_page.dart'
    as _i13;
import '../../view/pages/profile_page/children_pages/update_profile/update_profile_page.dart'
    as _i11;
import '../../view/pages/profile_page/profile_page.dart' as _i9;
import '../../view/pages/raffle_detail_page/raffle_detail_page.dart' as _i4;
import '../../view/pages/splash_page/splash_body.dart' as _i6;
import '../../view/pages/splash_page/splash_page.dart' as _i1;
import '../models/raffle.dart' as _i18;
import 'auth_guard.dart' as _i17;

class AppRouter extends _i2.RootStackRouter {
  AppRouter(
      {_i16.GlobalKey<_i16.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i17.AuthGuard authGuard;

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    ProfileMainRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    HomeMainRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomePage());
    },
    RaffleDetailRoute.name: (routeData) {
      final args = routeData.argsAs<RaffleDetailRouteArgs>();
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.RaffleDetailPage(args.raffle, key: args.key));
    },
    MyRafflesRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.MyRafflesPage());
    },
    AuthControllerRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.AuthController());
    },
    LoginRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.RegisterPage());
    },
    ProfileRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.ProfilePage());
    },
    EmptyRouterRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    ContactUsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.ContactUsPage());
    },
    UpdateProfileRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.UpdateProfilePage());
    },
    ChangePasswordRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.ChangePasswordPage());
    },
    PhoneVerifyRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.PhoneVerifyPage());
    },
    ChangeRaffleNickNameRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.ChangeRaffleNickNamePage());
    },
    MailVerifyRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.MailVerifyPage());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(SplashRoute.name, path: '/'),
        _i2.RouteConfig(ProfileMainRoute.name, path: '/profile-page', guards: [
          authGuard
        ], children: [
          _i2.RouteConfig(ProfileRoute.name,
              path: '', parent: ProfileMainRoute.name),
          _i2.RouteConfig(EmptyRouterRoute.name,
              path: 'update-profile-page',
              parent: ProfileMainRoute.name,
              children: [
                _i2.RouteConfig(UpdateProfileRoute.name,
                    path: '', parent: EmptyRouterRoute.name),
                _i2.RouteConfig(ChangePasswordRoute.name,
                    path: 'change-password-page',
                    parent: EmptyRouterRoute.name),
                _i2.RouteConfig(PhoneVerifyRoute.name,
                    path: 'verify-phone-page', parent: EmptyRouterRoute.name),
                _i2.RouteConfig(ChangeRaffleNickNameRoute.name,
                    path: 'change-raffle-nick-name-page',
                    parent: EmptyRouterRoute.name),
                _i2.RouteConfig(MailVerifyRoute.name,
                    path: 'verify-mail-page', parent: EmptyRouterRoute.name)
              ]),
          _i2.RouteConfig(ContactUsRoute.name,
              path: 'contact-us-page', parent: ProfileMainRoute.name)
        ]),
        _i2.RouteConfig(HomeMainRoute.name, path: '/home-page'),
        _i2.RouteConfig(RaffleDetailRoute.name, path: '/raffle-page'),
        _i2.RouteConfig(MyRafflesRoute.name,
            path: '/console-page', guards: [authGuard]),
        _i2.RouteConfig(AuthControllerRoute.name, path: '/controller-page'),
        _i2.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i2.RouteConfig(RegisterRoute.name, path: '/register-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i2.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class ProfileMainRoute extends _i2.PageRouteInfo<void> {
  const ProfileMainRoute({List<_i2.PageRouteInfo>? children})
      : super(ProfileMainRoute.name,
            path: '/profile-page', initialChildren: children);

  static const String name = 'ProfileMainRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomeMainRoute extends _i2.PageRouteInfo<void> {
  const HomeMainRoute() : super(HomeMainRoute.name, path: '/home-page');

  static const String name = 'HomeMainRoute';
}

/// generated route for
/// [_i4.RaffleDetailPage]
class RaffleDetailRoute extends _i2.PageRouteInfo<RaffleDetailRouteArgs> {
  RaffleDetailRoute({required _i18.Raffle raffle, _i16.Key? key})
      : super(RaffleDetailRoute.name,
            path: '/raffle-page',
            args: RaffleDetailRouteArgs(raffle: raffle, key: key));

  static const String name = 'RaffleDetailRoute';
}

class RaffleDetailRouteArgs {
  const RaffleDetailRouteArgs({required this.raffle, this.key});

  final _i18.Raffle raffle;

  final _i16.Key? key;

  @override
  String toString() {
    return 'RaffleDetailRouteArgs{raffle: $raffle, key: $key}';
  }
}

/// generated route for
/// [_i5.MyRafflesPage]
class MyRafflesRoute extends _i2.PageRouteInfo<void> {
  const MyRafflesRoute() : super(MyRafflesRoute.name, path: '/console-page');

  static const String name = 'MyRafflesRoute';
}

/// generated route for
/// [_i6.AuthController]
class AuthControllerRoute extends _i2.PageRouteInfo<void> {
  const AuthControllerRoute()
      : super(AuthControllerRoute.name, path: '/controller-page');

  static const String name = 'AuthControllerRoute';
}

/// generated route for
/// [_i7.LoginPage]
class LoginRoute extends _i2.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i8.RegisterPage]
class RegisterRoute extends _i2.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-page');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i9.ProfilePage]
class ProfileRoute extends _i2.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class EmptyRouterRoute extends _i2.PageRouteInfo<void> {
  const EmptyRouterRoute({List<_i2.PageRouteInfo>? children})
      : super(EmptyRouterRoute.name,
            path: 'update-profile-page', initialChildren: children);

  static const String name = 'EmptyRouterRoute';
}

/// generated route for
/// [_i10.ContactUsPage]
class ContactUsRoute extends _i2.PageRouteInfo<void> {
  const ContactUsRoute() : super(ContactUsRoute.name, path: 'contact-us-page');

  static const String name = 'ContactUsRoute';
}

/// generated route for
/// [_i11.UpdateProfilePage]
class UpdateProfileRoute extends _i2.PageRouteInfo<void> {
  const UpdateProfileRoute() : super(UpdateProfileRoute.name, path: '');

  static const String name = 'UpdateProfileRoute';
}

/// generated route for
/// [_i12.ChangePasswordPage]
class ChangePasswordRoute extends _i2.PageRouteInfo<void> {
  const ChangePasswordRoute()
      : super(ChangePasswordRoute.name, path: 'change-password-page');

  static const String name = 'ChangePasswordRoute';
}

/// generated route for
/// [_i13.PhoneVerifyPage]
class PhoneVerifyRoute extends _i2.PageRouteInfo<void> {
  const PhoneVerifyRoute()
      : super(PhoneVerifyRoute.name, path: 'verify-phone-page');

  static const String name = 'PhoneVerifyRoute';
}

/// generated route for
/// [_i14.ChangeRaffleNickNamePage]
class ChangeRaffleNickNameRoute extends _i2.PageRouteInfo<void> {
  const ChangeRaffleNickNameRoute()
      : super(ChangeRaffleNickNameRoute.name,
            path: 'change-raffle-nick-name-page');

  static const String name = 'ChangeRaffleNickNameRoute';
}

/// generated route for
/// [_i15.MailVerifyPage]
class MailVerifyRoute extends _i2.PageRouteInfo<void> {
  const MailVerifyRoute()
      : super(MailVerifyRoute.name, path: 'verify-mail-page');

  static const String name = 'MailVerifyRoute';
}
