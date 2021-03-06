import 'package:flutter/material.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:teststore/common/refactor_price.dart';
import 'package:teststore/core/helpers/navigation/nav_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                  Text(
                    AppLocalizations.of(context)?.addToCart ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: (AppLocalizations.of(context)?.language ?? '') == 'English' ?  18 : 16,
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