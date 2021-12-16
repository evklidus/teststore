import 'package:dartz/dartz.dart';
import 'package:teststore/core/error/exception.dart';

import 'package:teststore/core/error/failure.dart';
import 'package:teststore/core/platform/network_info.dart';
import 'package:teststore/features/home/data/datasources/home_local_data_sources.dart';
import 'package:teststore/features/home/data/datasources/home_remote_data_sources.dart';
import 'package:teststore/features/home/domain/entities/home_entity.dart';
import 'package:teststore/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSouce localDataSource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, HomeEntity>> getMainData() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteHomeData = await remoteDataSource.getHomeData();
        localDataSource.homeDataToCache(remoteHomeData);
        return Right(remoteHomeData);
      } on ServerException {
        return Left(ServerFailure());
      } catch (error) {
        return Left(UnknownFailure());
      }
    } else {
      try {
        final localHomeData = await localDataSource.getHomeData();
        return Right(localHomeData);
      } on CacheException {
        return Left(CacheFailure());
      } catch (error) {
        return Left(UnknownFailure());
      }
    }
  }
}
