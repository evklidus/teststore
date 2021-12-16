import 'package:dartz/dartz.dart';
import 'package:teststore/core/error/failure.dart';
import 'package:teststore/features/detail/domain/entities/phone_entity.dart';

abstract class DetailRepository {
  Future<Either<Failure, DetailEntity>> getDetails();
}