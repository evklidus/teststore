import 'package:flutter/material.dart';
import 'package:teststore/features/cart/domain/entities/cart_entity.dart';
import 'package:teststore/features/cart/presentation/widgets/cart_info.dart';
import 'package:teststore/features/cart/presentation/widgets/title.dart';
import 'package:teststore/features/cart/presentation/widgets/top_buttons.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({required this.cart, Key? key}) : super(key: key);

  final CartEntity cart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CartTopButtons(),
          const SizedBox(height: 40),
          const CartTitle(),
          const Spacer(),
          CartInfo(cart: cart),
        ],
      ),
    );
  }
}
