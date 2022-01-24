import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../feature/global_view_models/auth/auth_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Container(
            child: Text(state.user?.mail ?? "BOŞ"),
          );
        },
      ),
    );
  }
}
