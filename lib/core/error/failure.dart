import 'package:equatable/equatable%202.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class UnknownFailure extends Failure {}

class InternetConntectionFailure extends Failure {}