import 'package:flutter/material.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:teststore/core/helpers/nav_helper.dart';

import 'top_button.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, top: 20, right: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const TopButton(
                icon: 'lib/assets/icons/LineLeft.svg',
                color: AppColors.blueColor),
          ),
          const Text(
            'Product Details',
            style: TextStyle(
              color: AppColors.blueColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const InkWell(
            onTap: NavigatorHelper.pushToCart,
            child: TopButton(
                icon: 'lib/assets/icons/MiniBag.svg',
                color: AppColors.orangeColor),
          ),
        ],
      ),
    );
  }
}
