import 'package:get_it/get_it.dart';
import 'package:pandorora_app/feature/repositories/product_repository.dart';
import '../../feature/repositories/user_operations_repository.dart';
import '../../view/pages/profile_page/bloc/profilepage_bloc.dart';

import '../../feature/repositories/auth_repository.dart';
import '../../feature/repositories/global_repository.dart';

final getIt = GetIt.instance;

void setupGetIt() async {
  getIt.registerSingletonAsync<GlobalRepository>(() async {
    final _result = GlobalRepository();
    await _result.tokenInit();
    await _result.getFirebaseApiKey();
    _result.authServiceInit();
    return _result;
  });
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
  getIt.registerLazySingleton<ProductRepository>(() => ProductRepository());
  getIt.registerLazySingleton<ProfilepageBloc>(() => ProfilepageBloc());
  getIt.registerLazySingleton<UserOperationsRepository>(
      () => UserOperationsRepository());
}
