// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teststore/core/error/failure.dart';
import 'package:teststore/common/images.dart';
import 'package:teststore/features/home/domain/entities/best_seller_entity.dart';
import 'package:teststore/features/home/domain/entities/home_store_entity.dart';
import 'package:teststore/features/home/domain/usecases/get_home_data.dart';

part 'home_event.dart';
part 'home_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const INTERNET_CONNECTION_FAILURE_MESSAGE = 'Internet connection Failure';
const UNKNOWN_FAILURE_MESSAGE = 'Unknown Failure';

final SERVER_FAILURE_IMAGE = Images.serverFailure;
final INTERNET_CONNECTION_FAILURE_IMAGE = Images.internetConnectionFailure;
final UNKNOWN_FAILURE_IMAGE = Images.unknownFailure;

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeData getHomeData;

  HomeBloc({required this.getHomeData}) : super(HomeEmptyState()) {
    on<LoadHomeScreenEvent>((event, emit) async {
      emit(HomeLoadingState());
      final failureOrHomeData = await getHomeData();
      emit(failureOrHomeData.fold(
        (failure) => HomeErrorState(
            message: _mapFailureToMessage(failure),
            image: _mapFailureToImage(failure)),
        (homeData) => HomeLoadedState(
          bestPhones: homeData.bestSellerPhones as List<BestSellerPhoneEntity>,
          phones: homeData.homeStorePhones as List<HomeStorePhoneEntity>,
        ),
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
