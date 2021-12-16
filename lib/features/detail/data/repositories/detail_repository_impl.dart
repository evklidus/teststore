import 'package:dartz/dartz.dart';
import 'package:teststore/core/error/exception.dart';

import 'package:teststore/core/error/failure.dart';
import 'package:teststore/core/platform/network_info.dart';
import 'package:teststore/features/detail/data/datasources/detail_local_data_source.dart';
import 'package:teststore/features/detail/data/datasources/detail_remote_data_source.dart';
import 'package:teststore/features/detail/data/models/phone_model.dart';
import 'package:teststore/features/detail/domain/repositories/detail_repository.dart';

class DetailRepositoryImpl implements DetailRepository {
  DetailRemoteDataSource remoteDataSource;
  DetailLocalDataSouce localDataSource;
  final NetworkInfo networkInfo;

  DetailRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, DetailModel>> getDetails() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteDetail = await remoteDataSource.getDetail();
        localDataSource.detailsToCache(remoteDetail);
        return Right(remoteDetail);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localDetail = await localDataSource.getDetail();
        return Right(localDetail);
      } on CacheException {
        return Left(CacheFailure());
      } catch (error) {
        return Left(UnknownFailure());
      }
    }
  }
}
