import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:teststore/components/shadow.dart';
import 'package:teststore/features/detail/domain/entities/phone_entity.dart';
import 'package:teststore/features/detail/presentation/widgets/phone_info_widget/pi_categories.dart';
import 'package:teststore/features/detail/presentation/widgets/phone_info_widget/pi_info_category_data.dart';
import 'package:teststore/features/detail/presentation/widgets/phone_info_widget/pi_add_to_cart_button.dart';

import '../memory_and_color.dart';

class PhoneInfo extends StatelessWidget {
  const PhoneInfo({required this.phone, Key? key}) : super(key: key);

  final DetailEntity phone;

  @override
  Widget build(BuildContext context) {
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
              const PhoneInfoCategories(),
              PhoneInfoCategoryData(phone: phone),
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
              PhoneInfoAddToCart(price: phone.price),
            ],
          ),
        ),
      ),
    );
  }
}
