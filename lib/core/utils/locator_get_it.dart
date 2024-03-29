import 'package:get_it/get_it.dart';
import 'package:pandorora_app/view/pages/profile_page/children_pages/update_profile/cubit/updateprofile_cubit.dart';
import '../network/raffle_service.dart';
import '../network/user_service.dart';
import '../../view/pages/home_page/repo/filter_repository.dart';
import '../../feature/repositories/raffle_repository.dart';
import '../../feature/repositories/user_operations_repository.dart';
import '../../view/pages/home_page/bloc/pagination_bloc.dart';

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
  getIt.registerLazySingleton<FilterRepository>(() => FilterRepository());
  getIt.registerLazySingleton<RaffleRepository>(() => RaffleRepository());

  getIt.registerLazySingleton<PaginationBloc>(() => PaginationBloc());
  getIt.registerLazySingleton<UpdateprofileCubit>(() => UpdateprofileCubit());
  getIt.registerLazySingleton<RaffleService>(() => RaffleService());
  getIt.registerLazySingleton<UserService>(() => UserService());
  getIt.registerLazySingleton<UserOperationsRepository>(
      () => UserOperationsRepository());
}
