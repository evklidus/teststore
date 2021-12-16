import 'package:flutter/material.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:teststore/common/refactor_price.dart';
import 'package:teststore/components/shadow.dart';
import 'package:teststore/features/cart/domain/entities/cart_entity.dart';

import 'basket_item.dart';

class CartInfo extends StatelessWidget {
  CartInfo({required this.cart, Key? key}) : super(key: key);

  CartEntity cart;

  @override
  Widget build(BuildContext context) {
    Widget _bottomText(String text, String value, bool isDelivery) {
      return Padding(
        padding: EdgeInsets.only(left: 50, right: isDelivery ? 65 : 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }

    return SizedBox(
      height: MediaQuery.of(context).size.width * 1.38,
      width: MediaQuery.of(context).size.width,
      child: ShadowContainer(
        color: AppColors.blueColor,
        topRounded: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Column(
            children: [
              Column(
                children: cart.basket
                    .map(
                      (basketItem) => BasketItem(
                        basketItem: basketItem,
                      ),
                    )
                    .toList(),
              ),
              const Spacer(),
              Container(
                color: Colors.white.withOpacity(0.25),
                height: 2,
                width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(
                height: 15,
              ),
              _bottomText(
                'Total',
                '${refactorPrice(price: cart.total, withComma: true, withZeros: false)} us',
                false,
              ),
              const SizedBox(
                height: 10,
              ),
              _bottomText('Delivery', cart.delivery, true),
              const SizedBox(
                height: 25,
              ),
              Container(
                color: Colors.white.withOpacity(0.2),
                height: 2,
                width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(
                height: 25,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: AppColors.orangeColor,
                  width: MediaQuery.of(context).size.width / 1.2,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  child: const Text(
                    'Checkout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
