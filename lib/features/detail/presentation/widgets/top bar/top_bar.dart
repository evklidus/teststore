import 'package:flutter/material.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:teststore/common/app_icons.dart';
import 'package:teststore/core/helpers/nav_helper.dart';
import 'top_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            child: TopButton(
                icon: AppIcons.lineLeft,
                color: AppColors.blueColor),
          ),
          Text(
            AppLocalizations.of(context)?.productDetails ?? '',
            style: const TextStyle(
              color: AppColors.blueColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          InkWell(
            onTap: NavigatorHelper.pushToCart,
            child: TopButton(
                icon: AppIcons.miniBag,
                color: AppColors.orangeColor),
          ),
        ],
      ),
    );
  }
}
