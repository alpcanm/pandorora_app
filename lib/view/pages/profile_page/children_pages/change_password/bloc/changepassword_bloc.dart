import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/locator_get_it.dart';
import '../../../../../../feature/repositories/global_repository.dart';
import '../../../../../../feature/repositories/user_operations_repository.dart';

part 'changepassword_event.dart';
part 'changepassword_state.dart';

class ChangepasswordBloc
    extends Bloc<ChangepasswordEvent, ChangepasswordState> {
  final _userOperationRepo = getIt<UserOperationsRepository>();
  final _globalRepo = getIt<GlobalRepository>();

  String? _idtoken;
  ChangepasswordBloc() : super(ChangepasswordInitial()) {
    on<ChangepasswordConfirmCurrentPasswordRequest>(
        _confirmCurrentPasswordRequest);
    on<ChangepasswordChangeNewPasswordRequest>(_changeNewPasswordRequest);
  }

  _confirmCurrentPasswordRequest(
      ChangepasswordConfirmCurrentPasswordRequest event,
      Emitter<ChangepasswordState> emit) async {
    if (formKeyCurrentPassword.currentState!.validate()) {
      emit(ChangepasswordLoading());
      String _mail = _globalRepo.user?.mail ?? "";
      _idtoken = await _userOperationRepo.signInAndGetIdToken(
          mail: _mail, password: currentPasswordController.text);
      if (_idtoken != null) {
        emit(ChangepasswordCurrentPasswordVerified());
      } else {
        emit(ChangepasswordError());
      }
    }
  }

  _changeNewPasswordRequest(ChangepasswordChangeNewPasswordRequest event,
      Emitter<ChangepasswordState> emit) async {
    if (formKeyCurrentPassword.currentState!.validate()) {
      emit(ChangepasswordLoading());
      bool _result = await _userOperationRepo.changePassword(
          idToken: _idtoken ?? "", newPassword: newPasswordController.text);
      if (_result) {
        emit(ChangepasswordNewPasswordVerified());
      } else {
        emit(ChangepasswordError());
      }
      _idtoken = null;
    }
  }

  String? confirmPasswordValidator(String? value) {
    if (value != null && value.isEmpty) {
      return 'Empty field';
    } else if (value != newPasswordController.text) {
      return 'Not matched';
    } else {
      return null;
    }
  }

  final formKeyCurrentPassword = GlobalKey<FormState>();
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();
  @override
  Future<void> close() {
    currentPasswordController.dispose();
    confirmNewPasswordController.dispose();
    newPasswordController.dispose();
    return super.close();
  }
}
