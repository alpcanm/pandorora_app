// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../../view/pages/authentication_pages/login_page/login_page.dart'
    as _i5;
import '../../view/pages/authentication_pages/not_login_page.dart' as _i6;
import '../../view/pages/authentication_pages/register_page/register_page.dart'
    as _i7;
import '../../view/pages/home_page/home_page.dart' as _i3;
import '../../view/pages/profile_page/profile_page.dart' as _i2;
import '../../view/pages/splash_page/splash_body.dart' as _i4;
import '../../view/pages/splash_page/splash_page.dart' as _i1;
import 'auth_guard.dart' as _i10;

class AppRouter extends _i8.RootStackRouter {
  AppRouter(
      {_i9.GlobalKey<_i9.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i10.AuthGuard authGuard;

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    ProfileRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.ProfilePage());
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomePage());
    },
    AuthControllerRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.AuthController());
    },
    LoginRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.LoginPage());
    },
    NotLoginRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.NotLoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.RegisterPage());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(SplashRoute.name, path: '/'),
        _i8.RouteConfig(ProfileRoute.name,
            path: '/profile-page', guards: [authGuard]),
        _i8.RouteConfig(HomeRoute.name,
            path: '/home-page', guards: [authGuard]),
        _i8.RouteConfig(AuthControllerRoute.name, path: '/controller-page'),
        _i8.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i8.RouteConfig(NotLoginRoute.name, path: '/not-login-page'),
        _i8.RouteConfig(RegisterRoute.name, path: '/register-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.ProfilePage]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '/profile-page');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.AuthController]
class AuthControllerRoute extends _i8.PageRouteInfo<void> {
  const AuthControllerRoute()
      : super(AuthControllerRoute.name, path: '/controller-page');

  static const String name = 'AuthControllerRoute';
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i6.NotLoginPage]
class NotLoginRoute extends _i8.PageRouteInfo<void> {
  const NotLoginRoute() : super(NotLoginRoute.name, path: '/not-login-page');

  static const String name = 'NotLoginRoute';
}

/// generated route for
/// [_i7.RegisterPage]
class RegisterRoute extends _i8.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-page');

  static const String name = 'RegisterRoute';
}
