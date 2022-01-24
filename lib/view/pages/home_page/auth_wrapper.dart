import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../feature/global_view_models/auth/auth_bloc.dart';
import 'home_page.dart';

class AuthWrapperPage extends StatelessWidget implements AutoRouteWrapper {
  const AuthWrapperPage({
    Key? key,
    required this.authBloc,
  }) : super(key: key);
  final AuthBloc authBloc;
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(value: authBloc, child: this);
  }

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
