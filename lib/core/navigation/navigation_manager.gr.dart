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
import 'package:flutter/material.dart' as _i15;

import '../../view/pages/authentication_pages/login_page/login_page.dart'
    as _i5;
import '../../view/pages/authentication_pages/not_login_page.dart' as _i6;
import '../../view/pages/authentication_pages/register_page/register_page.dart'
    as _i7;
import '../../view/pages/console_page/console_page.dart' as _i3;
import '../../view/pages/home_page/home_page.dart' as _i13;
import '../../view/pages/home_page/product_page/product_page.dart' as _i14;
import '../../view/pages/profile_page/children_pages/change_password/change_password_page.dart'
    as _i11;
import '../../view/pages/profile_page/children_pages/contact_us/contact_us_page.dart'
    as _i10;
import '../../view/pages/profile_page/children_pages/phone_verify_page/phone_verify_page.dart'
    as _i12;
import '../../view/pages/profile_page/children_pages/update_profile/update_profile_page.dart'
    as _i9;
import '../../view/pages/profile_page/profile_page.dart' as _i8;
import '../../view/pages/splash_page/splash_body.dart' as _i4;
import '../../view/pages/splash_page/splash_page.dart' as _i1;
import 'auth_guard.dart' as _i16;

class AppRouter extends _i2.RootStackRouter {
  AppRouter(
      {_i15.GlobalKey<_i15.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i16.AuthGuard authGuard;

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
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    ConsoleRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ConsolePage());
    },
    AuthControllerRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.AuthController());
    },
    LoginRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.LoginPage());
    },
    NotLoginRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.NotLoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.RegisterPage());
    },
    ProfileRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ProfilePage());
    },
    UpdateProfileRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.UpdateProfilePage());
    },
    ContactUsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.ContactUsPage());
    },
    ChangePasswordRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.ChangePasswordPage());
    },
    PhoneVerifyRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.PhoneVerifyPage());
    },
    HomeRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.HomePage());
    },
    ProductRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.ProductPage());
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
          _i2.RouteConfig(UpdateProfileRoute.name,
              path: 'update-profile-page', parent: ProfileMainRoute.name),
          _i2.RouteConfig(ContactUsRoute.name,
              path: 'contact-us-page', parent: ProfileMainRoute.name),
          _i2.RouteConfig(ChangePasswordRoute.name,
              path: 'change-password-page', parent: ProfileMainRoute.name),
          _i2.RouteConfig(PhoneVerifyRoute.name,
              path: 'verify-phone-page', parent: ProfileMainRoute.name)
        ]),
        _i2.RouteConfig(HomeMainRoute.name, path: '/home-page', guards: [
          authGuard
        ], children: [
          _i2.RouteConfig(HomeRoute.name, path: '', parent: HomeMainRoute.name),
          _i2.RouteConfig(ProductRoute.name,
              path: 'product-page', parent: HomeMainRoute.name)
        ]),
        _i2.RouteConfig(ConsoleRoute.name,
            path: '/console-page', guards: [authGuard]),
        _i2.RouteConfig(AuthControllerRoute.name, path: '/controller-page'),
        _i2.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i2.RouteConfig(NotLoginRoute.name, path: '/not-login-page'),
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
/// [_i2.EmptyRouterPage]
class HomeMainRoute extends _i2.PageRouteInfo<void> {
  const HomeMainRoute({List<_i2.PageRouteInfo>? children})
      : super(HomeMainRoute.name,
            path: '/home-page', initialChildren: children);

  static const String name = 'HomeMainRoute';
}

/// generated route for
/// [_i3.ConsolePage]
class ConsoleRoute extends _i2.PageRouteInfo<void> {
  const ConsoleRoute() : super(ConsoleRoute.name, path: '/console-page');

  static const String name = 'ConsoleRoute';
}

/// generated route for
/// [_i4.AuthController]
class AuthControllerRoute extends _i2.PageRouteInfo<void> {
  const AuthControllerRoute()
      : super(AuthControllerRoute.name, path: '/controller-page');

  static const String name = 'AuthControllerRoute';
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i2.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i6.NotLoginPage]
class NotLoginRoute extends _i2.PageRouteInfo<void> {
  const NotLoginRoute() : super(NotLoginRoute.name, path: '/not-login-page');

  static const String name = 'NotLoginRoute';
}

/// generated route for
/// [_i7.RegisterPage]
class RegisterRoute extends _i2.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-page');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i8.ProfilePage]
class ProfileRoute extends _i2.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i9.UpdateProfilePage]
class UpdateProfileRoute extends _i2.PageRouteInfo<void> {
  const UpdateProfileRoute()
      : super(UpdateProfileRoute.name, path: 'update-profile-page');

  static const String name = 'UpdateProfileRoute';
}

/// generated route for
/// [_i10.ContactUsPage]
class ContactUsRoute extends _i2.PageRouteInfo<void> {
  const ContactUsRoute() : super(ContactUsRoute.name, path: 'contact-us-page');

  static const String name = 'ContactUsRoute';
}

/// generated route for
/// [_i11.ChangePasswordPage]
class ChangePasswordRoute extends _i2.PageRouteInfo<void> {
  const ChangePasswordRoute()
      : super(ChangePasswordRoute.name, path: 'change-password-page');

  static const String name = 'ChangePasswordRoute';
}

/// generated route for
/// [_i12.PhoneVerifyPage]
class PhoneVerifyRoute extends _i2.PageRouteInfo<void> {
  const PhoneVerifyRoute()
      : super(PhoneVerifyRoute.name, path: 'verify-phone-page');

  static const String name = 'PhoneVerifyRoute';
}

/// generated route for
/// [_i13.HomePage]
class HomeRoute extends _i2.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i14.ProductPage]
class ProductRoute extends _i2.PageRouteInfo<void> {
  const ProductRoute() : super(ProductRoute.name, path: 'product-page');

  static const String name = 'ProductRoute';
}
