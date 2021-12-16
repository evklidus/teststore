import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:teststore/core/helpers/database/db_helper.dart';
import 'package:teststore/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:teststore/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:teststore/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:teststore/features/cart/domain/repositories/cart_repository.dart';
import 'package:teststore/features/cart/domain/usecases/get_cart.dart';
import 'package:teststore/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:teststore/features/detail/data/datasources/detail_local_data_source.dart';
import 'package:teststore/features/detail/data/datasources/detail_remote_data_source.dart';
import 'package:teststore/features/detail/data/repositories/detail_repository_impl.dart';
import 'package:teststore/features/detail/domain/repositories/detail_repository.dart';
import 'package:teststore/features/detail/domain/usecases/get_phone.dart';
import 'package:teststore/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:teststore/features/home/data/datasources/home_local_data_sources.dart';
import 'package:teststore/features/home/data/datasources/home_remote_data_sources.dart';
import 'package:teststore/features/home/data/repositories/home_repository_impl.dart';
import 'package:teststore/features/home/domain/repositories/home_repository.dart';
import 'package:teststore/features/home/domain/usecases/get_home_data.dart';
import 'package:sqflite/sqflite.dart';

import 'package:http/http.dart' as http;

import 'core/platform/network_info.dart';
import 'features/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC
  sl.registerFactory(() => HomeBloc(getHomeData: sl()));
  sl.registerFactory(() => DetailBloc(getDetails: sl()));
  sl.registerFactory(() => CartBloc(getCart: sl()));

  // UseCases
  sl.registerLazySingleton(() => GetHomeData(homeRepository: sl()));
  sl.registerLazySingleton(() => GetDetails(detailRepository: sl()));
  sl.registerLazySingleton(() => GetCart(cartRepository: sl()));

  // Repository
  sl.registerFactory<HomeRepository>(
    () => HomeRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
      localDataSource: sl(),
    ),
  );
  sl.registerFactory<DetailRepository>(
    () => DetailRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
      localDataSource: sl(),
    ),
  );
  sl.registerFactory<CartRepository>(
    () => CartRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  //Data Source
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<HomeLocalDataSouce>(
      () => HomeLocalDataSouceImpl(db: sl()));

  sl.registerLazySingleton<DetailRemoteDataSource>(
      () => DetailRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<DetailLocalDataSouce>(
      () => DetailLocalDataSouceImpl(db: sl()));

  sl.registerLazySingleton<CartRemoteDataSource>(
      () => CartRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<CartLocalDataSouce>(
      () => CartLocalDataSouceImpl(db: sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImp(sl()),
  );

  // External
  Database database = await DBHelper().db;
  sl.registerLazySingleton(() => database);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
