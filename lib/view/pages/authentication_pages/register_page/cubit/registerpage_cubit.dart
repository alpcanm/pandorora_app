import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../feature/repositories/global_repository.dart';
import '../../../../../feature/repositories/user_operations_repository.dart';

import '../../../../../core/utils/locator_get_it.dart';

part 'registerpage_state.dart';

class RegisterpageCubit extends Cubit<RegisterpageState> {
  RegisterpageCubit() : super(RegisterpageInitial());
  final _globalRepo = getIt<GlobalRepository>();
  final _userOperationRepo = getIt<UserOperationsRepository>();
  final nameController = TextEditingController();

  final mailController = TextEditingController();
  final raffleNickNameController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPassowrdController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> submit() async {
    emit(RegisterpageLoading());
    bool _result = await _userOperationRepo.signUp(
        name: nameController.text.trim(),
        mail: mailController.text.trim(),
        raffleNickName: raffleNickNameController.text.trim(),
        password: passwordController.text.trim());
    if (_result) {
      await _globalRepo.signInCache.clearBox();
      await Future.wait([
        _globalRepo.signInCache.putToBox("mail", mailController.text),
        _globalRepo.signInCache.putToBox("password", passwordController.text),
      ]);

      emit(RegisterpageCompleted());
    } else {
      emit(RegisterpageError(errorMessage: _userOperationRepo.errorMessage));
    }
  }

  String? confirmPasswordValidator(String? value) {
    if (value != null && value.isEmpty) {
      return 'Empty field';
    } else if (value != passwordController.text) {
      return 'Not matched';
    } else {
      return null;
    }
  }
}
