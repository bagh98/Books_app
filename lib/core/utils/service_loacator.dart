import 'package:dio/dio.dart';
import 'package:ebook_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

import 'api_severs.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));
  getIt.get<ApiService>();

  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<ApiService>(),
  ));
}
