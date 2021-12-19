import 'package:flutter/material.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:teststore/common/refactor_price.dart';
import 'package:teststore/core/helpers/nav_helper.dart';

class PhoneInfoAddToCart extends StatelessWidget {
  const PhoneInfoAddToCart({required this.price, Key? key }) : super(key: key);

  final int price;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 5, top: 25, right: 5),
        child: InkWell(
          onTap: NavigatorHelper.pushToCart,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 35),
              color: AppColors.orangeColor,
              width: MediaQuery.of(context).size.width / 1.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Add to Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    refactorPrice(
                        price: price, withComma: true, withZeros: true),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}