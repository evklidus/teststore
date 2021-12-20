import 'package:flutter/material.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartTitle extends StatelessWidget {
  const CartTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Row(
        children: [
          Text(
            AppLocalizations.of(context)?.myCart ?? '',
            style: const TextStyle(
              color: AppColors.blueColor,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
