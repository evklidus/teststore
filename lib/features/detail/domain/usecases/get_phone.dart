import 'package:dartz/dartz.dart';

import 'package:teststore/core/error/failure.dart';
import 'package:teststore/core/usecases/usecase.dart';
import 'package:teststore/features/detail/domain/entities/phone_entity.dart';
import 'package:teststore/features/detail/domain/repositories/detail_repository.dart';

class GetDetails extends UseCase<DetailEntity> {
  final DetailRepository detailRepository;

  GetDetails({
    required this.detailRepository,
  });

  @override
  Future<Either<Failure, DetailEntity>> call() async {
    return await detailRepository.getDetails();
  }}
