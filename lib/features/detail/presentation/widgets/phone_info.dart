import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:teststore/common/refactor_price.dart';
import 'package:teststore/components/shadow.dart';
import 'package:teststore/core/helpers/nav_helper.dart';
import 'package:teststore/features/detail/domain/entities/phone_entity.dart';

import 'memory_and_color.dart';

class PhoneInfo extends StatelessWidget {
  const PhoneInfo({required this.phone, Key? key}) : super(key: key);

  final DetailEntity phone;

  @override
  Widget build(BuildContext context) {
    Widget _categories(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text(
                  'Shop',
                  style: TextStyle(
                    color: AppColors.blueColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: AppColors.orangeColor,
                        height: 2.5,
                        width: MediaQuery.of(context).size.width / 5,
                      )),
                ),
              ],
            ),
            const Text(
              'Details',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            const Text(
              'Features',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ],
        ),
      );
    }

    Widget _infoTextAndIcon(
        {required String text,
        required String icon,
        required BuildContext context}) {
      return SizedBox(
        height: MediaQuery.of(context).size.width / 9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              icon,
            ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
          ],
        ),
      );
    }

    Widget _addToCartButton(int price, BuildContext context) {
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

    return Expanded(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ShadowContainer(
          customPadding:
              const EdgeInsets.only(left: 25, top: 25, right: 25, bottom: 5),
          topRounded: true,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        phone.title,
                        style: const TextStyle(
                          color: AppColors.blueColor,
                          fontSize: 21,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: MediaQuery.of(context).size.width / 12,
                      width: MediaQuery.of(context).size.width / 10,
                      color: AppColors.blueColor,
                      child: Icon(
                        phone.isFavorites
                            ? Icons.favorite_rounded
                            : Icons.favorite_outline_rounded,
                        color: phone.isFavorites
                            ? AppColors.orangeColor
                            : Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1,
                child: Row(
                  children: [
                    RatingBar.builder(
                      initialRating: phone.rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 18,
                      ignoreGestures: true,
                      itemPadding: const EdgeInsets.only(right: 4),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        // print(rating);
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              _categories(context),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _infoTextAndIcon(
                        text: phone.cpu,
                        icon: 'lib/assets/icons/CPU.svg',
                        context: context),
                    _infoTextAndIcon(
                        text: phone.camera,
                        icon: 'lib/assets/icons/Camera.svg',
                        context: context),
                    _infoTextAndIcon(
                        text: phone.ssd,
                        icon: 'lib/assets/icons/FastMemory.svg',
                        context: context),
                    _infoTextAndIcon(
                        text: phone.sd,
                        icon: 'lib/assets/icons/Memory.svg',
                        context: context),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                children: const [
                  Text(
                    'Select color and capacity',
                    style: TextStyle(
                      color: AppColors.blueColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              MemoryAndColor(colors: phone.color, capacity: phone.capacity),
              _addToCartButton(phone.price, context),
            ],
          ),
        ),
      ),
    );
  }
}
