import 'package:dartz/dartz.dart';
import 'package:teststore/core/error/failure.dart';
import 'package:teststore/core/usecases/usecase.dart';
import 'package:teststore/features/cart/domain/entities/cart_entity.dart';

import '../repositories/cart_repository.dart';

class GetCart extends UseCase<CartEntity> {
  final CartRepository cartRepository;

  GetCart({
    required this.cartRepository,
  });

  @override
  Future<Either<Failure, CartEntity>> call() async {
    return await cartRepository.getCart();
  }
}
