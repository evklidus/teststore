import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:teststore/components/shadow.dart';
import 'package:teststore/features/home/domain/entities/best_seller_entity.dart';
import 'package:teststore/features/home/domain/entities/home_store_entity.dart';
import 'package:teststore/features/home/presentation/widgets/best_seller_phone.dart';
import 'package:teststore/features/home/presentation/widgets/categories.dart';
import 'package:teststore/features/home/presentation/widgets/hot_sales_phon.dart';

import 'search_input.dart';

class HomeScreen extends StatelessWidget {
  final List<HomeStorePhoneEntity> homeStorePhones;
  final List<BestSellerPhoneEntity> bestSellerPhones;

  HomeScreen({
    Key? key,
    required this.homeStorePhones,
    required this.bestSellerPhones,
  }) : super(key: key);

  final textController = TextEditingController();

  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          _geoAndFilter(context),
          const SizedBox(height: 20),
          _sectionTitleAndButton('Select Category', 'view all'),
          const SizedBox(height: 20),
          const HomeCategories(),
          const SizedBox(height: 30),
          _searchAndQR(context),
          const SizedBox(height: 30),
          _sectionTitleAndButton('Hot sales', 'see more'),
          const SizedBox(height: 20),
          _hotSalesPageView(context),
          const SizedBox(height: 20),
          _sectionTitleAndButton('Best Seller', 'see more'),
          const SizedBox(height: 10),
          _betSellerPhones(),
        ],
      ),
    );
  }

  void _showFilters(BuildContext context) async {
    await showModalBottomSheet(
        // constraints:
        //     BoxConstraints(maxHeight: MediaQuery.of(context).size.width),
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return ShadowContainer(
            topRounded: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            color: AppColors.blueColor,
                            child: SvgPicture.asset('lib/assets/icons/X.svg'),
                          ),
                        ),
                      ),
                      const Text(
                        'Filter options',
                        style: TextStyle(
                          color: AppColors.blueColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 15),
                            color: AppColors.orangeColor,
                            child: const Text(
                              'Done',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        _customDropdownButton('Brand', 'Samsung'),
                        const SizedBox(
                          height: 12,
                        ),
                        _customDropdownButton('Price', '\$300 - \$500'),
                        const SizedBox(
                          height: 12,
                        ),
                        _customDropdownButton('Size', '4.5 to 5.5 inches'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _customDropdownButton(String title, String labelText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.blueColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        // SizedBox( // you can uncomment this and following lines and check that DropdownButtonFormField is not working
          // height: 100,
          // child: 
          DropdownButtonFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: labelText,
            ),
            items: [
              if (title == 'Price')
              const DropdownMenuItem(
                child: Text('\$0 - \$300'),
                value: '\$0 - \$300',
              ),
              DropdownMenuItem(
                child: Text(labelText),
                value: labelText,
              ),
              if (title == 'Price')
              const DropdownMenuItem(
                child: Text('\$500 - \$10000'),
                value: '\$500 - \$10000',
              ),
            ],
            onChanged: (data) {},
          ),
        // )
      ],
    );
  }

  Widget _geoAndFilter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'lib/assets/icons/GeoTag.svg',
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Zihuatanejo, Gro',
                style: TextStyle(
                  color: Color(0xFF010035),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SvgPicture.asset(
                'lib/assets/icons/LineDown.svg',
              ),
            ],
          ),
          Positioned(
            right: 20,
            child: InkWell(
              onTap: () {
                _showFilters(context);
              },
              child: SvgPicture.asset(
                'lib/assets/icons/Filter.svg',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitleAndButton(String title, String buttonTitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.blueColor,
              fontSize: 25,
            ),
          ),
          Text(
            buttonTitle,
            style: const TextStyle(color: AppColors.orangeColor, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _searchAndQR(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width / 1.3,
            height: MediaQuery.of(context).size.width / 10,
            child: SearchInput(
                textController: textController, hintText: "Search")),
        SizedBox(
          height: MediaQuery.of(context).size.width / 10,
          width: MediaQuery.of(context).size.width / 10,
          child: ShadowContainer(
            child: SvgPicture.asset(
              'lib/assets/icons/QR.svg',
            ),
            isCircle: true,
            paddingValue: 10,
            color: AppColors.orangeColor,
          ),
        ),
      ],
    );
  }

  Widget _hotSalesPageView(BuildContext ctx) {
    return SizedBox(
      height: MediaQuery.of(ctx).size.width / 2.5,
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

  Widget _betSellerPhones() {
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
