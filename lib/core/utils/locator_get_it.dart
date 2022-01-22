import 'package:get_it/get_it.dart';
import 'package:pandorora_app/feature/repositories/auth_repository.dart';
import '../../feature/repositories/global_repository.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<GlobalRepository>(() => GlobalRepository());
}

void setupGetIt2() {
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
}
