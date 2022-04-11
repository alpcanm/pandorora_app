import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/models/user_model.dart';
import '../../../../../../core/utils/locator_get_it.dart';
import '../../../../../../feature/repositories/global_repository.dart';
import '../../../../../../feature/repositories/user_operations_repository.dart';

part 'updateprofile_state.dart';

class UpdateprofileCubit extends Cubit<UpdateprofileState> {
  final _userOperationRepo = getIt<UserOperationsRepository>();

  UpdateprofileCubit() : super(UpdateprofileInitial()) {
    _setControllers();
  }

  late TextEditingController nameController;
  late TextEditingController raffleNickController;
  late TextEditingController mailController;

  User get _user => getIt<GlobalRepository>()
      .user!; // güncel veriyi çekmesi için böyle kullanılmalı.

  _setControllers() {
    nameController = TextEditingController(text: _user.name);
    raffleNickController = TextEditingController(text: _user.raffleNickName);
    mailController = TextEditingController(text: _user.mail);
  }

  final formKey = GlobalKey<FormState>();

  bool get _checkField {
    // Eğer hiç bir alanı değiştirmemişse false dönecek
    if (nameController.text.trim() == _user.name &&
        raffleNickController.text.trim() == _user.raffleNickName) {
      return false;
    } else {
      return true;
    }
  }

  onFieldChanged(String? value) {
    if (_checkField) {
      emit(UpdateprofileButtonActive());
    } else {
      emit(UpdateprofileButtonPassive());
    }
  }

  update() async {
    if (formKey.currentState!.validate() && _checkField) {
      emit(UpdateprofileLoading());
      bool _result = await _userOperationRepo.updateUserData(
          uid: _user.uid ?? "",
          raffleNickName: raffleNickController.text.trim(),
          name: nameController.text.trim());
      if (_result) {
        await getIt<GlobalRepository>().tryGetCurrentUser();
        _setControllers();
        emit(UpdateprofileCompleted());
      } else {
        emit(UpdateprofileError(errorMessage: _userOperationRepo.errorMessage));
      }
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    raffleNickController.dispose();
    mailController.dispose();
    return super.close();
  }
}
