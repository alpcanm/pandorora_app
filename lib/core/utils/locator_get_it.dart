import 'package:get_it/get_it.dart';
import 'package:pandorora_app/feature/repositories/auth_repository.dart';
import 'package:pandorora_app/feature/repositories/init_repository.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton(() => InitRepository());
  getIt.registerLazySingleton(() => AuthRepository());
}
