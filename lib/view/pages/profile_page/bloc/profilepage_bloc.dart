import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/utils/locator_get_it.dart';
import '../../../../feature/repositories/auth_repository.dart';
import '../../../../feature/repositories/global_repository.dart';

part 'profilepage_event.dart';
part 'profilepage_state.dart';

class ProfilepageBloc extends Bloc<ProfilepageEvent, ProfilepageState> {
  final _authRepository = getIt<AuthRepository>();
  static final User _user = getIt<GlobalRepository>().user!;
  ProfilepageBloc() : super(ProfilepageInitial(_user)) {
    on<ProfilepageGetUpdatedUser>(_getUpdatedUser);
  }

  _getUpdatedUser(
      ProfilepageGetUpdatedUser event, Emitter<ProfilepageState> emit) async {
    final _repo = getIt<GlobalRepository>();
    await _repo.tryGetCurrentUser();
    if (_repo.user != null) {
      emit(ProfilepageChanged(_repo.user!));
    } else {
      emit(ProfilepageError(errorMessage: _authRepository.errorMessage));
    }
  }
}
