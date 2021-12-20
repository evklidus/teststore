import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teststore/components/error_screen.dart';
import 'package:teststore/components/load_indicator.dart';
import 'package:teststore/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:teststore/features/cart/presentation/pages/cart_screen.dart';

class CartBLoCScreen extends StatelessWidget {
  const CartBLoCScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartBloc>(context).add(LoadCartScreenEvent());
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          if (state is CartLoadingState) {
            return const LoadIndicator();
          }
          if (state is CartLoadedState) {
            return CartScreen(cart: state.cart);
          }
          if (state is CartErrorState) {
            return ErrorScreen(message: state.message, image: state.image);
          }
          return const ErrorScreen();
        }),
      ),
    );
  }
}
