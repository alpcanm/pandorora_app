import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/locator_get_it.dart';
import '../../../../../feature/repositories/auth_repository.dart';

part 'registerpage_state.dart';

class RegisterpageCubit extends Cubit<RegisterpageState> {
  RegisterpageCubit() : super(RegisterpageInitial());
  final _authRepository = getIt<AuthRepository>();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final mailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassowrdController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> submit() async {
    emit(RegisterpageLoading());
    bool _result = await _authRepository.signUp(
        name: nameController.text,
        surname: surnameController.text,
        mail: mailController.text,
        password: passwordController.text);
    if (_result) {
      emit(RegisterpageCompleted());
    } else {
      emit(RegisterpageError(errorMessage: _authRepository.errorMessage));
    }
  }



  String? confirmPasswordValidator(String? value) {
    if (value != null && value.isEmpty) {
      return 'Empty field';
    } else if (value != confirmPassowrdController.text) {
      return 'Not matched';
    } else {
      return null;
    }
  }


}
