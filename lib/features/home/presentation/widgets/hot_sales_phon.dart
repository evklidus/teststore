import 'package:flutter/material.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:teststore/components/cache_image.dart';
import 'package:teststore/features/home/domain/entities/home_store_entity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HotSalesPhone extends StatelessWidget {
  const HotSalesPhone({
    Key? key,
    required this.hotSalesPhone,
  }) : super(key: key);

  final HomeStorePhoneEntity hotSalesPhone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CacheImage(
              imageUrl: hotSalesPhone.picture,
              height: MediaQuery.of(context).size.width / 2.5,
              width: MediaQuery.of(context).size.width,
              cover: true,
            ),
            Positioned(
              left: 20,
              top: 10,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.orangeColor,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'New',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotSalesPhone.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Text(
                    hotSalesPhone.subtitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20,
              bottom: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  color: Colors.white,
                  child: Text(
                    AppLocalizations.of(context)?.buyNow ?? '',
                    style: const TextStyle(
                      color: AppColors.blueColor,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
