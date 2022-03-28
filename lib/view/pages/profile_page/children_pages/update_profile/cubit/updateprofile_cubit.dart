import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/models/user_model.dart';
import '../../../../../../core/utils/locator_get_it.dart';
import '../../../../../../feature/repositories/global_repository.dart';
import '../../../../../../feature/repositories/user_operations_repository.dart';

part 'updateprofile_state.dart';

class UpdateprofileCubit extends Cubit<UpdateprofileState> {
  static final User _user = getIt<GlobalRepository>().user!;
  final _userOperationRepo = getIt<UserOperationsRepository>();

  UpdateprofileCubit() : super(UpdateprofileInitial());

  final TextEditingController nameController =
      TextEditingController(text: _user.name);
  final TextEditingController surnameController =
      TextEditingController(text: _user.surname);
  final TextEditingController raffleNickController =
      TextEditingController(text: _user.raffleNickName);
  final TextEditingController mailController =
      TextEditingController(text: _user.mail);
  final formKey = GlobalKey<FormState>();

  bool get _checkField {
    // Eğer hiç bir alanı değiştirmemişse false dönecek
    if (nameController.text.trim() == _user.name &&
        surnameController.text.trim() == _user.surname &&
        raffleNickController.text.trim() == _user.raffleNickName &&
        mailController.text.trim() == _user.mail) {
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
      bool _result = await _userOperationRepo.update(
          raffleNickName: raffleNickController.text.trim(),
          mail: mailController.text.trim(),
          name: nameController.text.trim(),
          surname: surnameController.text.trim());
      if (_result) {
        await getIt<GlobalRepository>().tryGetCurrentUser();
        emit(UpdateprofileCompleted());
      } else {
        emit(UpdateprofileError(errorMessage: _userOperationRepo.errorMessage));
      }
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    surnameController.dispose();
    raffleNickController.dispose();
    mailController.dispose();
    return super.close();
  }
}
