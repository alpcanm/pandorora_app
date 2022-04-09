import 'package:auto_route/auto_route.dart';

import '../../feature/repositories/auth_repository.dart';
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
      router.push(const AuthControllerRoute());
    }
  }
}
