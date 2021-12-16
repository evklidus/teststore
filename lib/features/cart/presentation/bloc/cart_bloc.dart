// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teststore/core/error/failure.dart';
import 'package:teststore/common/images.dart';
import 'package:teststore/features/cart/domain/entities/basket_entity.dart';

import 'package:teststore/features/cart/domain/usecases/get_cart.dart';

import '../../domain/entities/cart_entity.dart';

part 'cart_event.dart';
part 'cart_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const INTERNET_CONNECTION_FAILURE_MESSAGE = 'Internet connection Failure';
const UNKNOWN_FAILURE_MESSAGE = 'Unknown Failure';

final SERVER_FAILURE_IMAGE = Images.serverFailure;
final INTERNET_CONNECTION_FAILURE_IMAGE = Images.internetConnectionFailure;
final UNKNOWN_FAILURE_IMAGE = Images.unknownFailure;

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCart getCart;

  late CartLoadedState cartLoadedState;

  CartBloc({required this.getCart}) : super(CartLoadingState()) {
    String getItemsCount(List<BasketEntity> items) {
      int count = 0;
      for (var item in items) {
        count += item.count;
      }
      return count.toString();
    }

    CartLoadingState cartLoadingState = CartLoadingState();
// 1
    getCartLoadedState(CartEntity cart) {
      cartLoadedState = CartLoadedState(cart: cart);
      cartLoadedState.itemCount =
          getItemsCount(cart.basket as List<BasketEntity>);
      cartLoadingState.itemCount =
          getItemsCount(cart.basket as List<BasketEntity>);
      return cartLoadedState;
    }

    on<LoadCartScreenEvent>((event, emit) async {
      emit(cartLoadingState);
      final failureOrCart = await getCart();
      emit(failureOrCart.fold(
        (failure) => CartErrorState(
            message: _mapFailureToMessage(failure),
            image: _mapFailureToImage(failure)),
        (cart) => getCartLoadedState(cart),
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
