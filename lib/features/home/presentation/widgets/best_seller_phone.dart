import 'package:flutter/material.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:teststore/components/cache_image.dart';
import 'package:teststore/common/refactor_price.dart';
import 'package:teststore/components/shadow.dart';
import 'package:teststore/features/detail/presentation/pages/deteils_bloc_screen.dart';
import 'package:teststore/features/home/domain/entities/best_seller_entity.dart';

class BestSellerPhone extends StatelessWidget {
  final BestSellerPhoneEntity phone;
  final int index;

  const BestSellerPhone({
    Key? key,
    required this.phone,
    required this.index,
  }) : super(key: key);

  bool _isLeftItem(int index) {
    if (index == 0) {
      return true;
    }
    if (index % 2 == 0) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 6,
        bottom: 6,
        left: _isLeftItem(index) ? 20 : 7,
        right: _isLeftItem(index) ? 7 : 20,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const DetailsBLoCScreen()),
          );
        },
        child: ShadowContainer(
          radius: 10,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    _image(context),
                    _priceAndName(phone),
                  ],
                ),
              ),
              Positioned(
                right: 10,
                top: 8,
                child: _likeButton(phone.isFavorites),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _image(BuildContext context) {
    return Expanded(
      child: CacheImage(imageUrl: phone.picture, cover:  false,),
    );
  }

  Widget _likeButton(bool liked) {
    return ShadowContainer(
      child: Icon(
        liked ? Icons.favorite_rounded : Icons.favorite_outline_rounded,
        color: AppColors.orangeColor,
        size: 18,
      ),
      moreShadow: true,
      isCircle: true,
    );
  }
}

Widget _priceAndName(BestSellerPhoneEntity phone) {
  return Padding(
    padding: const EdgeInsets.only(left: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              refactorPrice(
                  price: phone.discountPrice,
                  withComma: true,
                  withZeros: false),
              style: const TextStyle(
                color: AppColors.blueColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            Column(
              children: [
                Text(
                  refactorPrice(
                      price: phone.priceWithoutDiscount,
                      withComma: true,
                      withZeros: false),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(
                  height: 1.5,
                )
              ],
            )
          ],
        ),
        Text(
          phone.title,
          style: const TextStyle(
            color: AppColors.blueColor,
            fontSize: 10,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}
