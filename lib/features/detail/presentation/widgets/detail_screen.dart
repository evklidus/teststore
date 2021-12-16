import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:teststore/components/cache_image.dart';
import 'package:teststore/components/shadow.dart';
import 'package:teststore/features/cart/presentation/pages/cart_bloc_screen.dart';
import 'package:teststore/features/detail/domain/entities/phone_entity.dart';
import 'package:teststore/features/detail/presentation/widgets/phone_info.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({required this.phone, Key? key}) : super(key: key);

  DetailEntity phone;

  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35, top: 20, right: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: _topButton('lib/assets/icons/LineLeft.svg',
                      AppColors.blueColor, context),
                ),
                const Text(
                  'Product Details',
                  style: TextStyle(
                    color: AppColors.blueColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const CartBLoCScreen()),
                    );
                  },
                  child: _topButton('lib/assets/icons/MiniBag.svg',
                      AppColors.orangeColor, context),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 1.35,
            child: PageView(
              physics: const BouncingScrollPhysics(),
              controller: pageController,
              scrollDirection: Axis.horizontal,
              children: phone.images
                  .map(
                    (imageUrl) => _phoneImage(imageUrl, context),
                  )
                  .toList(),
            ),
          ),
          PhoneInfo(phone: phone),
        ],
      ),
    );
  }

  Widget _topButton(String icon, Color color, BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: MediaQuery.of(context).size.width / 10,
        width: MediaQuery.of(context).size.width / 10,
        padding: const EdgeInsets.all(10),
        color: color,
        child: SvgPicture.asset(
          icon,
        ),
      ),
    );
  }

  Widget _phoneImage(String imageUrl, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: ShadowContainer(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: CacheImage(imageUrl: imageUrl, cover: true,),
        ),
        color: Colors.transparent,
      ),
    );
  }
}
