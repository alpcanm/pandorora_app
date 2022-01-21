import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pandorora_app/core/models/user_model.dart';
import 'package:pandorora_app/core/utils/locator_get_it.dart';
import 'package:pandorora_app/feature/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository = getIt<AuthRepository>();
  AuthBloc() : super(const AuthUnknown()) {
    on<AuthLogoutRequested>(_onAuthenticationLogoutRequested);
    on<AuthLoginRequested>(_onAuthLogInRequested);
    on<AuthTryGetCurrentUser>(_tryGetCurrentUser);
  }

  Future<void> _tryGetCurrentUser(
      AuthTryGetCurrentUser event, Emitter<AuthState> emit) async {
    User? _user = await _authRepository.tryGetCurrentUser();
    if (_user != null) {
      emit(AuthAuthenticated(_user));
    } else {
      emit(const AuthUnauthenticated());
    }
  }

  Future<void> _onAuthLogInRequested(
      AuthLoginRequested event, Emitter<AuthState> emit) async {
    bool _result = await _authRepository.signIn(
        mail: event.mail, password: event.password);

    if (_result) {
      add(AuthTryGetCurrentUser());
    } else {
      emit(const AuthUnauthenticated());
    }
  }

  void _onAuthenticationLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) {
    _authRepository.signOut();
    emit(const AuthUnauthenticated());
  }
}
