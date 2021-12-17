import 'package:flutter/material.dart';
import 'package:teststore/common/app_colors.dart';

class CartTitle extends StatelessWidget {
  const CartTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
