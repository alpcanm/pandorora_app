
import 'package:auto_route/auto_route.dart';
import 'package:pandorora_app/core/utils/locator_get_it.dart';
import 'package:pandorora_app/feature/repositories/auth_repository.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    final AuthRepository _authRepository = getIt<AuthRepository>();
    bool _result =
        _authRepository.status == AuthStatus.authenticated ? true : false;
    if (_result) {
      resolver.next(true);
    } else {
      // router.push(const NotLoginRoute());
    }
  }
}
