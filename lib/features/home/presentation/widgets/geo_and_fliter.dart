import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:teststore/components/shadow.dart';

import 'custom_dropdown_button.dart';

class GeoAndFilter extends StatelessWidget {
  const GeoAndFilter({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

  void _showFilters(BuildContext context) async {
    await showModalBottomSheet(
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
                      children: const [
                        CustomDropdownButton(title: 'Brand', labelText: 'Samsung',),
                        SizedBox(
                          height: 12,
                        ),
                        CustomDropdownButton(title: 'Price', labelText: '\$300 - \$500',),
                        SizedBox(
                          height: 12,
                        ),
                        CustomDropdownButton(title: 'Size', labelText: '4.5 to 5.5 inches',),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}