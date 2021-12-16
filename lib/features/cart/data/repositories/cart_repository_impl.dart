import 'package:dartz/dartz.dart';
import 'package:teststore/core/error/exception.dart';
import 'package:teststore/core/platform/network_info.dart';
import 'package:teststore/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:teststore/features/cart/domain/entities/basket_entity.dart';
import 'package:teststore/features/cart/domain/entities/cart_entity.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repositories/cart_repository.dart';
import '../datasources/cart_remote_data_source.dart';

class CartRepositoryImpl implements CartRepository {
  CartRemoteDataSource remoteDataSource;
  CartLocalDataSouce localDataSource;
  final NetworkInfo networkInfo;

  CartRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, CartEntity<BasketEntity>>> getCart() async {
    if (await networkInfo.isConnected) {
      try {
        final cart = await remoteDataSource.getCart();
        localDataSource.cartToCache(cart);
        return Right(cart);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localCart = await localDataSource.getCart();
        return Right(localCart);
      } on CacheException {
        return Left(CacheFailure());
      } catch (error) {
        return Left(UnknownFailure());
      }
    }
  }
}
