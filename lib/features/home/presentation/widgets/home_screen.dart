import 'package:flutter/material.dart';
import 'package:teststore/features/home/domain/entities/best_seller_entity.dart';
import 'package:teststore/features/home/domain/entities/home_store_entity.dart';
import 'package:teststore/features/home/presentation/widgets/best_seller_phones_grid.dart';
import 'package:teststore/features/home/presentation/widgets/categories.dart';
import 'package:teststore/features/home/presentation/widgets/geo_and_fliter.dart';
import 'package:teststore/features/home/presentation/widgets/hot_sales_page_view.dart';
import 'package:teststore/features/home/presentation/widgets/search_and_qr.dart';
import 'package:teststore/features/home/presentation/widgets/section_title_and_button.dart';


class HomeScreen extends StatelessWidget {
  final List<HomeStorePhoneEntity> homeStorePhones;
  final List<BestSellerPhoneEntity> bestSellerPhones;

  const HomeScreen({
    Key? key,
    required this.homeStorePhones,
    required this.bestSellerPhones,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const GeoAndFilter(),
          const SizedBox(height: 20),
          const SectionTitleAndButton(title: 'Select Category', buttonTitle: 'view all'),
          const SizedBox(height: 20),
          const HomeCategories(),
          const SizedBox(height: 30),
          SearchAndQr(),
          const SizedBox(height: 30),
          const SectionTitleAndButton(title: 'Hot sales', buttonTitle: 'see more'),
          const SizedBox(height: 20),
          HotSalesPageView(homeStorePhones: homeStorePhones,),
          const SizedBox(height: 20),
          const SectionTitleAndButton(title: 'Select Category', buttonTitle: 'view all'),
          const SizedBox(height: 10),
          BestSellerPhonesGrid(bestSellerPhones: bestSellerPhones,),
        ],
      ),
    );
  }
}
