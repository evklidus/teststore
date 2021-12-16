import 'package:flutter/material.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:teststore/features/cart/domain/entities/cart_entity.dart';
import 'package:teststore/features/cart/presentation/widgets/cart_info.dart';
import 'package:teststore/features/cart/presentation/widgets/top_buttons.dart';

class CartScreen extends StatelessWidget {
  CartScreen({required this.cart, Key? key}) : super(key: key);

  CartEntity cart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CartTopButtons(),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: const [
                Text(
                  'My Cart',
                  style: TextStyle(
                    color: AppColors.blueColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          const Spacer(),
          CartInfo(cart: cart),
        ],
      ),
    );
  }
}
