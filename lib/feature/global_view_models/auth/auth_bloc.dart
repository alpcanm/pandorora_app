import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/models/user_model.dart';
import '../../../core/utils/locator_get_it.dart';
import '../../repositories/auth_repository.dart';
import '../../repositories/global_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthUnknown()) {
    on<AuthTryGetCurrentUser>(_tryGetCurrentUser);
    add(AuthTryGetCurrentUser());
  }

  Future<void> _tryGetCurrentUser(
      AuthTryGetCurrentUser event, Emitter<AuthState> emit) async {
    final _repo = getIt<GlobalRepository>();
    await _repo.tryGetCurrentUser();
    if (_repo.user != null) {
      emit(AuthAuthenticated(_repo.user!));
    } else {
      emit(const AuthUnauthenticated());
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
