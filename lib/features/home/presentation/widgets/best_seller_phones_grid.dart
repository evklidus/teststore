import 'package:flutter/material.dart';
import 'package:teststore/features/home/domain/entities/best_seller_entity.dart';

import 'best_seller_phone.dart';

class BestSellerPhonesGrid extends StatelessWidget {
  const BestSellerPhonesGrid({required this.bestSellerPhones, Key? key }) : super(key: key);

  final List<BestSellerPhoneEntity> bestSellerPhones;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: bestSellerPhones.length,
      itemBuilder: (contex, index) {
        return BestSellerPhone(
          phone: bestSellerPhones[index],
          index: index,
        );
      },
    );
  }
}