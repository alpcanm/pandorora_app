// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../../feature/global_view_models/auth/auth_bloc.dart' as _i10;
import '../../view/pages/authentication_pages/login_page/login_page.dart'
    as _i3;
import '../../view/pages/authentication_pages/not_login_page.dart' as _i4;
import '../../view/pages/authentication_pages/register_page/register_page.dart'
    as _i5;
import '../../view/pages/home_page/auth_wrapper.dart' as _i1;
import '../../view/pages/profile_page/profile_page.dart' as _i6;
import '../../view/pages/splash_page/splash_page.dart' as _i2;
import 'auth_guard.dart' as _i9;

class AppRouter extends _i7.RootStackRouter {
  AppRouter(
      {_i8.GlobalKey<_i8.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i9.AuthGuard authGuard;

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AuthWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<AuthWrapperRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.AuthWrapperPage(key: args.key, authBloc: args.authBloc));
    },
    SplashRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SplashPage());
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.LoginPage(key: args.key));
    },
    NotLoginRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.NotLoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.RegisterPage());
    },
    ProfileRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ProfilePage());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(AuthWrapperRoute.name, path: '/auth', guards: [
          authGuard
        ], children: [
          _i7.RouteConfig(ProfileRoute.name,
              path: 'profile-page', parent: AuthWrapperRoute.name)
        ]),
        _i7.RouteConfig(SplashRoute.name, path: '/'),
        _i7.RouteConfig(LoginRoute.name, path: '/'),
        _i7.RouteConfig(NotLoginRoute.name, path: '/not-login-page'),
        _i7.RouteConfig(RegisterRoute.name, path: '/register-page')
      ];
}

/// generated route for
/// [_i1.AuthWrapperPage]
class AuthWrapperRoute extends _i7.PageRouteInfo<AuthWrapperRouteArgs> {
  AuthWrapperRoute(
      {_i8.Key? key,
      required _i10.AuthBloc authBloc,
      List<_i7.PageRouteInfo>? children})
      : super(AuthWrapperRoute.name,
            path: '/auth',
            args: AuthWrapperRouteArgs(key: key, authBloc: authBloc),
            initialChildren: children);

  static const String name = 'AuthWrapperRoute';
}

class AuthWrapperRouteArgs {
  const AuthWrapperRouteArgs({this.key, required this.authBloc});

  final _i8.Key? key;

  final _i10.AuthBloc authBloc;

  @override
  String toString() {
    return 'AuthWrapperRouteArgs{key: $key, authBloc: $authBloc}';
  }
}

/// generated route for
/// [_i2.SplashPage]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i8.Key? key})
      : super(LoginRoute.name, path: '/', args: LoginRouteArgs(key: key));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.NotLoginPage]
class NotLoginRoute extends _i7.PageRouteInfo<void> {
  const NotLoginRoute() : super(NotLoginRoute.name, path: '/not-login-page');

  static const String name = 'NotLoginRoute';
}

/// generated route for
/// [_i5.RegisterPage]
class RegisterRoute extends _i7.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-page');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i6.ProfilePage]
class ProfileRoute extends _i7.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile-page');

  static const String name = 'ProfileRoute';
}
