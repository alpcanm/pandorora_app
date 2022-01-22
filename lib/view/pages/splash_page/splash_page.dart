import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pandorora_app/feature/global_view_models/auth/auth_bloc.dart';
import '../../../core/navigation/navigation_manager.gr.dart';
import '../../../feature/global_view_models/auth/auth_bloc.dart';
import '../../../feature/repositories/auth_repository.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    initFunction();
  }

  initFunction() async {
    List<Future> futures = [dotenv.load(fileName: ".env"), Hive.initFlutter()];
    await Future.wait(futures);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          switch (state.status) {
            case AuthStatus.authenticated:
              context.router.replace(const HomeRoute());
              break;
            default:
              context.router.replace(const LoginRoute());
              break;
          }
        },
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
