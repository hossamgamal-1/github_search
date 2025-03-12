import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/search/data/data_source/search_local_data_source.dart';
import '../../features/search/data/data_source/search_remote_data_source.dart';
import '../../features/search/data/repo/search_repo.dart';
import '../networking/dio_factory.dart';
import '../networking/dio_helper.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => prefs);

  getIt.registerLazySingleton<Dio>(() => DioFactory.instance);
  getIt.registerLazySingleton<ApiHelper>(() => DioHelperImpl(getIt()));

  getIt.registerLazySingleton(() => SearchRemoteDataSource(getIt()));
  getIt.registerLazySingleton(() => SearchLocalDataSource(getIt()));
  getIt.registerLazySingleton(() => SearchRepo(getIt(), getIt()));
}

Future<void> refreshGetIt() async {
  await getIt.reset();
  await setupGetIt();
}
