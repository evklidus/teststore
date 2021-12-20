import 'package:flutter/material.dart';
import 'package:teststore/components/shadow.dart';
import 'package:teststore/features/detail/domain/entities/phone_entity.dart';
import 'package:teststore/features/detail/presentation/widgets/phone_info_widget/pi_categories.dart';
import 'package:teststore/features/detail/presentation/widgets/phone_info_widget/pi_info_category_data.dart';
import 'package:teststore/features/detail/presentation/widgets/phone_info_widget/pi_add_to_cart_button.dart';
import 'package:teststore/features/detail/presentation/widgets/phone_info_widget/pi_title.dart';
import 'package:teststore/features/detail/presentation/widgets/phone_info_widget/pi_title_for_memory.dart';
import 'package:teststore/features/detail/presentation/widgets/phone_info_widget/pi_rating_bar.dart';

import '../pi_memory_and_color.dart';

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
              PhoneInfoTitle(title: phone.title),
              PhoneInfoRatingBar(rating: phone.rating,),
              const PhoneInfoCategories(),
              PhoneInfoCategoryData(phone: phone),
              const SizedBox(
                height: 18,
              ),
              const PhoneInfoTitleForMemory(),
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
