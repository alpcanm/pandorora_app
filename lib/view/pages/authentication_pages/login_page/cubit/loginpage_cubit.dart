import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../feature/repositories/global_repository.dart';
import '../../../../../core/utils/locator_get_it.dart';
import '../../../../../feature/repositories/auth_repository.dart';

part 'loginpage_state.dart';

class LoginpageCubit extends Cubit<LoginpageState> {
  final AuthRepository _authRepository = getIt<AuthRepository>();
  final _globalRepo = getIt<GlobalRepository>();
  late TextEditingController mailController;
  late TextEditingController passwordController;
  LoginpageCubit() : super(LoginpageInitial()) {
    setControllerValues();
  }

  setControllerValues() {
    print("object");
    String? mail, password;
    if (_globalRepo.signInCache.isNotEmpty() == true) {
      mail = _globalRepo.signInCache.getAValue("mail");
      password = _globalRepo.signInCache.getAValue("password");
    }
    mailController = TextEditingController(text: mail);
    passwordController = TextEditingController(text: password);
  }

  final formKey = GlobalKey<FormState>();
  bool isChecked = true;

  Future<void> signIn() async {
    emit(LoginpageLoading());
    bool _result = await _authRepository.signIn(
        mail: mailController.text, password: passwordController.text);
    if (_result) {
      emit(LoginpageCompleted());
      _globalRepo.signInCache
          .clearBox()
          .then((value) async => isChecked ? await setToCache() : null);
    } else {
      emit(LoginpageError(errorMessage: _authRepository.errorMessage));
    }
  }

  Future<void> setToCache() async {
    await Future.wait([
      _globalRepo.signInCache.putToBox("mail", mailController.text),
      _globalRepo.signInCache.putToBox("password", passwordController.text),
    ]);
  }

  @override
  Future<void> close() {
    mailController.dispose();
    passwordController.dispose();

    return super.close();
  }
}
