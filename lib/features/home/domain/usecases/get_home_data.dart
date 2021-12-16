import 'package:dartz/dartz.dart';

import 'package:teststore/core/error/failure.dart';
import 'package:teststore/core/usecases/usecase.dart';
import 'package:teststore/features/home/domain/entities/home_entity.dart';
import 'package:teststore/features/home/domain/repositories/home_repository.dart';

class GetHomeData extends UseCase<HomeEntity> {
  final HomeRepository homeRepository;

  GetHomeData({
    required this.homeRepository,
  });

  @override
  Future<Either<Failure, HomeEntity>> call() async {
    return await homeRepository.getMainData();
  }
}
