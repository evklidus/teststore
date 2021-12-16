// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teststore/core/error/failure.dart';
import 'package:teststore/common/images.dart';
import 'package:teststore/features/detail/domain/entities/phone_entity.dart';
import 'package:teststore/features/detail/domain/usecases/get_phone.dart';

part 'detail_event.dart';
part 'detail_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const INTERNET_CONNECTION_FAILURE_MESSAGE = 'Internet connection Failure';
const UNKNOWN_FAILURE_MESSAGE = 'Unknown Failure';

final SERVER_FAILURE_IMAGE = Images.serverFailure;
final INTERNET_CONNECTION_FAILURE_IMAGE = Images.internetConnectionFailure;
final UNKNOWN_FAILURE_IMAGE = Images.unknownFailure;

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetDetails getDetails;

  DetailBloc({required this.getDetails}) : super(DetailEmptyState()) {
    on<LoadDetailScreenEvent>((event, emit) async {
      emit(DetailLoadingState());
      final failureOrPhoneDetails = await getDetails();
      emit(failureOrPhoneDetails.fold(
        (failure) => DetailErrorState(
            message: _mapFailureToMessage(failure),
            image: _mapFailureToImage(failure)),
        (details) => DetailLoadedState(phoneDetails: details),
      ));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case InternetConntectionFailure:
        return INTERNET_CONNECTION_FAILURE_MESSAGE;
      case UnknownFailure:
        return UNKNOWN_FAILURE_MESSAGE;
      default:
        return UNKNOWN_FAILURE_MESSAGE;
    }
  }

  String _mapFailureToImage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case InternetConntectionFailure:
        return INTERNET_CONNECTION_FAILURE_IMAGE;
      case UnknownFailure:
        return UNKNOWN_FAILURE_IMAGE;
      default:
        return UNKNOWN_FAILURE_IMAGE;
    }
  }
}
