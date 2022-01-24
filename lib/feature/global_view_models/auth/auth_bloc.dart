import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pandorora_app/feature/repositories/global_repository.dart';
import '../../../core/utils/locator_get_it.dart';
import '../../../core/models/user_model.dart';
import '../../repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository = getIt<AuthRepository>();
  AuthBloc() : super(const AuthUnknown()) {
    on<AuthTryGetCurrentUser>(_tryGetCurrentUser);
    print('asdas');
    add(AuthTryGetCurrentUser());
  }

  Future<void> _tryGetCurrentUser(
      AuthTryGetCurrentUser event, Emitter<AuthState> emit) async {
    User? _user = await _authRepository.tryGetCurrentUser();
    if (_user != null) {
      getIt<GlobalRepository>().user = _user;
      emit(AuthAuthenticated(_user));
    } else {
      emit(const AuthUnauthenticated());
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
