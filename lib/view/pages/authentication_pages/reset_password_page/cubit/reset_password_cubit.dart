import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:pandorora_app/feature/repositories/global_repository.dart';

import '../../../../../core/utils/locator_get_it.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  final formKey = GlobalKey<FormState>();
  final mailcontroller = TextEditingController();

  Future<bool> resetPassword() async {
    if (formKey.currentState!.validate()) {
      return await getIt<GlobalRepository>()
          .authService
          .sendResetPasswordMail(mailcontroller.text.trim());
    }
    return false;
  }

  @override
  Future<void> close() {
    mailcontroller.dispose();
    return super.close();
  }
}
