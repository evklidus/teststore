import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:teststore/common/app_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartTopButtons extends StatelessWidget {
  const CartTopButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _topButton(String icon, Color color, BuildContext context) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: MediaQuery.of(context).size.width / 10,
          width: MediaQuery.of(context).size.width / 10,
          padding: const EdgeInsets.all(10),
          color: color,
          child: SvgPicture.asset(
            icon,
            color: Colors.white,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(left: 35, top: 20, right: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: InkWell(
              onTap: Navigator.of(context).pop,
              child: _topButton(AppIcons.lineLeft,
                  AppColors.blueColor, context),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)?.addAddress ?? '',
                style: const TextStyle(
                  color: AppColors.blueColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 7),
              _topButton(AppIcons.geoTag, AppColors.orangeColor,
                  context),
            ],
          ),
        ],
      ),
    );
  }
}
