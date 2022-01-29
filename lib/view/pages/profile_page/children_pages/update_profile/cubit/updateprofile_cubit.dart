import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/models/user_model.dart';
import '../../../../../../core/utils/locator_get_it.dart';
import '../../../../../../feature/repositories/auth_repository.dart';
import '../../../../../../feature/repositories/global_repository.dart';
import '../../../bloc/profilepage_bloc.dart';

part 'updateprofile_state.dart';

class UpdateprofileCubit extends Cubit<UpdateprofileState> {
  static final User _user = getIt<GlobalRepository>().user!;
  final _authRepository = getIt<AuthRepository>();
  final _profilePageBloc = getIt<ProfilepageBloc>();
  UpdateprofileCubit() : super(UpdateprofileInitial());

  final TextEditingController nameController =
      TextEditingController(text: _user.name);
  final TextEditingController surnameController =
      TextEditingController(text: _user.surname);
  final TextEditingController drawNickController =
      TextEditingController(text: _user.drawNickName);
  final TextEditingController mailController =
      TextEditingController(text: _user.mail);
  final formKey = GlobalKey<FormState>();

  bool get _checkField {
    // Eğer hiç bir alanı değiştirmemişse false dönecek
    if (nameController.text.trim() == _user.name &&
        surnameController.text.trim() == _user.surname &&
        drawNickController.text.trim() == _user.drawNickName &&
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
      bool _result = await _authRepository.update(
          drawNickName: drawNickController.text.trim(),
          mail: mailController.text.trim(),
          name: nameController.text.trim(),
          surname: surnameController.text.trim());
      if (_result) {
        _profilePageBloc.add(ProfilepageGetUpdatedUser());
        emit(UpdateprofileCompleted());
      } else {
        emit(UpdateprofileError(errorMessage: _authRepository.errorMessage));
      }
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    surnameController.dispose();
    drawNickController.dispose();
    mailController.dispose();
    return super.close();
  }
}
