import 'package:auto_route/auto_route.dart';

import '../../feature/repositories/auth_repository.dart';
import '../../view/pages/home_page/bloc/pagination_bloc.dart';
import '../utils/locator_get_it.dart';
import 'navigation_manager.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    final AuthRepository _authRepository = getIt<AuthRepository>();
    bool _result = _authRepository.authGuardStatus == AuthStatus.authenticated
        ? true
        : false;
    if (_result) {
      resolver.next(true);
    } else {
      getIt.resetLazySingleton<PaginationBloc>();// my Raffles yüklenmesi için.
      router.push(const AuthControllerRoute());
    }
  }
}
