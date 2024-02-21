import 'package:shared_preferences/shared_preferences.dart';

import '../../app/data/data_sources/get_users_data_source.dart';
import '../../app/data/repositories/get_user_repo_imp.dart';
import '../../app/domain/repositories/get_users.dart';
import '../../app/domain/use_cases/get_user_usecase.dart';
import '../../app/presentation/manager/user_cubit.dart';
import '../network/client/api_consumer.dart';
import '../network/client/app_preferences.dart';
import '../network/client/dio_consumer.dart';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
class ServicesLocator {

  Future<void> initApp() async {
    sl.registerLazySingleton(() => Dio());
    sl.registerLazySingleton(() => DioConsumer(sl<Dio>()));
    final sharedPreference = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => AppPreferences(sharedPreference));
    sl.registerFactory(() => UserCubit());
    sl.registerLazySingleton(() => GetUserUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseGetUserRepository>(
            () => GetUserRepoImplementation(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseGetUsersRemoteDataSource>(
            () => GetUsersRemoteDataSource(sl<DioConsumer>()));
  }
}