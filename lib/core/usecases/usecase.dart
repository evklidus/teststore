import 'package:dartz/dartz.dart';
import 'package:teststore/core/error/failure.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call();
}