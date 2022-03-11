import 'package:get_it/get_it.dart';
import 'package:pandorora_app/view/pages/home_page/components/home_filters/tag_list.dart';
import '../../feature/repositories/raffle_repository.dart';
import '../../feature/repositories/user_operations_repository.dart';
import '../../view/pages/home_page/bloc/pagination_bloc.dart';
import '../../view/pages/profile_page/bloc/profilepage_bloc.dart';

import '../../feature/repositories/auth_repository.dart';
import '../../feature/repositories/global_repository.dart';
import '../network/raffle_service.dart';

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
  getIt.registerLazySingleton<TagList>(() => TagList());
  getIt.registerLazySingleton<RaffleRepository>(() => RaffleRepository());
  getIt.registerLazySingleton<ProfilepageBloc>(() => ProfilepageBloc());
  getIt.registerLazySingleton<PaginationBloc>(() => PaginationBloc());
  getIt.registerLazySingleton<UserOperationsRepository>(
      () => UserOperationsRepository());
}
