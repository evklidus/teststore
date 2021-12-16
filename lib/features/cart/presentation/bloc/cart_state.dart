// ignore_for_file: must_be_immutable

part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();  

  @override
  List<Object> get props => [];
}

class CartEmptyState extends CartState {}

class CartLoadingState extends CartState {
  String itemCount = '';
}

class CartLoadedState extends CartState {
  final CartEntity cart;
  String itemCount = '';
  
  CartLoadedState({
    required this.cart,
  });
}

class CartErrorState extends CartState {
  String message;
  String image;
  
  CartErrorState({
    required this.message,
    required this.image,
  });
}

