import 'package:dio/dio.dart';
import 'package:ebook_app/core/utils/api_severs.dart';
import 'package:get_it/get_it.dart';

import '../../Features/home/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<ApiService>(),
  ));
}
