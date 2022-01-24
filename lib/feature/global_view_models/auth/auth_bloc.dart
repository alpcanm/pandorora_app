import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/utils/locator_get_it.dart';
import '../../../core/models/user_model.dart';
import '../../repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository = getIt<AuthRepository>();
  AuthBloc() : super(const AuthUnknown()) {
    on<AuthTryGetCurrentUser>(_tryGetCurrentUser);
    on<AuthStatusChanged>(_authStatusChanged);
    _authRepository.authStatus.listen((status) {
      if (status != AuthStatus.authenticated) add(AuthStatusChanged(status));
    });
  }

  void _authStatusChanged(AuthStatusChanged event, Emitter<AuthState> emit) {
    switch (event.status) {
      case AuthStatus.unauthenticated:
        emit(const AuthUnauthenticated());
        break;
      default:
        add(AuthTryGetCurrentUser());
    }
  }

  Future<void> _tryGetCurrentUser(
      AuthTryGetCurrentUser event, Emitter<AuthState> emit) async {
    User? _user = await _authRepository.tryGetCurrentUser();
    if (_user != null) {
      emit(AuthAuthenticated(_user));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
