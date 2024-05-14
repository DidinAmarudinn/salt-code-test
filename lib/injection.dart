import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:salt_code_test/core/api/dio_services.dart';
import 'package:salt_code_test/core/helper/database_helper.dart';
import 'package:salt_code_test/core/router/app_router.dart';
import 'package:salt_code_test/data/datasource/local/news_local_datasource_impl.dart';
import 'package:salt_code_test/data/datasource/remote/news_remote_datasource.dart';
import 'package:salt_code_test/data/datasource/remote/news_remote_datasource_impl.dart';
import 'package:salt_code_test/data/repositories/news_repository_impl.dart';
import 'package:salt_code_test/domain/repository/news_repository.dart';
import 'package:salt_code_test/domain/usecase/get_news_usecase.dart';
import 'package:salt_code_test/presentations/bloc/home_bloc/home_bloc.dart';

import 'core/helper/network_info.dart';
import 'data/datasource/local/news_local_datasource.dart';

final locator = GetIt.instance;

void init() async {
  // dio
  locator.registerLazySingleton(
    () => dioServices(),
  );

  // router
  locator.registerLazySingleton(() => AppRouter());

  // services
  locator.registerLazySingleton<NewsRemoteDataSource>(
    () => NewsRemoteDataSourceImpl(
      dio: locator(),
    ),
  );
  locator.registerLazySingleton<NewsLocalDataSource>(
    () => NewsLocalDataSourceImpl(
      databaseHelper: locator(),
    ),
  );

  // repositories
  locator.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(
        remoteDataSource: locator(),
        localDataSource: locator(),
        networkInfo: locator()),
  );

  // usecase
  locator.registerLazySingleton(() => GetNewsUsecase(locator()));


  // bloc
   locator.registerFactory(
    () => HomeBloc(getNews: locator()),
  );


   // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // network info
  locator.registerLazySingleton(() => InternetConnection());
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));
}
