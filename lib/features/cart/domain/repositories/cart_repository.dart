import 'package:dartz/dartz.dart';
import 'package:teststore/features/cart/domain/entities/cart_entity.dart';

import '../../../../core/error/failure.dart';

abstract class CartRepository {
  Future<Either<Failure, CartEntity>> getCart();
}
