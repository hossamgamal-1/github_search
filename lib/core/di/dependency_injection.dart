import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../networking/dio_factory.dart';
import '../networking/dio_helper.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<Dio>(() => DioFactory.instance);
  getIt.registerLazySingleton<ApiHelper>(() => DioHelperImpl(getIt()));
}

Future<void> refreshGetIt() async {
  await getIt.reset();
  await setupGetIt();
}
