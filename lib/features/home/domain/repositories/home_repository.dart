import 'package:dartz/dartz.dart';
import 'package:teststore/core/error/failure.dart';
import 'package:teststore/features/home/domain/entities/home_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeEntity>> getMainData();
}