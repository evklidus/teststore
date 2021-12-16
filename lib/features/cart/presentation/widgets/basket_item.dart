import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:teststore/common/refactor_price.dart';
import 'package:teststore/components/cache_image.dart';
import 'package:teststore/features/cart/domain/entities/basket_entity.dart';

class BasketItem extends StatelessWidget {
  BasketItem({required this.basketItem, Key? key}) : super(key: key);

  BasketEntity basketItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 40),
      child: SizedBox(
        height: MediaQuery.of(context).size.width / 4.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CacheImage(
                imageUrl: basketItem.image,
                cover: true,
                width: MediaQuery.of(context).size.width / 4.8,
                height: MediaQuery.of(context).size.width / 4.8,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Text(
                      basketItem.title,
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    refactorPrice(
                        price: basketItem.price,
                        withZeros: true,
                        withComma: false),
                    style: const TextStyle(
                      color: AppColors.orangeColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 6,
              width: MediaQuery.of(context).size.width / 15,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  color: const Color(0xFF282843),
                  padding: const EdgeInsets.only(
                      left: 6, top: 12, right: 6, bottom: 6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('lib/assets/icons/Minus.svg'),
                      Text(
                        '${basketItem.count}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      // const SizedBox(height: 10),
                      SvgPicture.asset('lib/assets/icons/Plus.svg'),
                    ],
                  ),
                ),
              ),
            ),
            SvgPicture.asset('lib/assets/icons/Trash.svg'),
          ],
        ),
      ),
    );
  }
}
