import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:pandorora_app/feature/repositories/global_repository.dart';
import '../../../../../core/utils/locator_get_it.dart';
import '../../../../../feature/repositories/auth_repository.dart';

part 'loginpage_state.dart';

class LoginpageCubit extends Cubit<LoginpageState> {
  final AuthRepository _authRepository = getIt<AuthRepository>();
  final _globalRepository = getIt<GlobalRepository>();
  LoginpageCubit() : super(LoginpageInitial());
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> signIn() async {
    emit(LoginpageLoading());
    try {
      bool _result = await _authRepository.signIn(
          mail: mailController.text, password: passwordController.text);
      if (_result) {
        emit(LoginpageCompleted());
      } else {
        LoginpageError(errorMessage: _globalRepository.errorMessage);
      }
    } catch (e) {
      emit(LoginpageError(
          errorMessage: _globalRepository.errorMessage ?? e.toString()));
    }
  }

  @override
  Future<void> close() {
    mailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
