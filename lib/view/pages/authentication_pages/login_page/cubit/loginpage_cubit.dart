import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:pandorora_app/core/utils/locator_get_it.dart';
import '../../../../../feature/repositories/auth_repository.dart';

part 'loginpage_state.dart';

class LoginpageCubit extends Cubit<LoginpageState> {
  final AuthRepository _authRepository = getIt<AuthRepository>();
  LoginpageCubit() : super(LoginpageDefault());
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> signIn() async {
    emit(LoginpageLoading());

    // if (getIt<InitRepository>().tokenCache.isNotEmpty(Keys.token) == true) {
    //   String? _token =
    //       getIt<InitRepository>().tokenCache.getValues(Keys.token)?.first;
    //   print(_token);
    // }

    await _authRepository.signIn(
        mail: mailController.text, password: passwordController.text);
    emit(LoginpageDefault());
  }

  @override
  Future<void> close() {
    mailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
