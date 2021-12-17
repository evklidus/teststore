import 'package:flutter/material.dart';
import 'package:teststore/features/home/domain/entities/home_store_entity.dart';

import 'hot_sales_phon.dart';

class HotSalesPageView extends StatelessWidget {
  HotSalesPageView({required this.homeStorePhones, Key? key }) : super(key: key);

  final List<HomeStorePhoneEntity> homeStorePhones;

  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / 2.5,
      child: PageView(
        physics: const BouncingScrollPhysics(),
        padEnds: false,
        allowImplicitScrolling: true,
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: homeStorePhones
            .map(
              (homeStorePhone) => HotSalesPhone(hotSalesPhone: homeStorePhone),
            )
            .toList(),
      ),
    );
  }
}