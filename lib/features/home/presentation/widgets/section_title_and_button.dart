import 'package:flutter/material.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SectionTitleAndButton extends StatelessWidget {
  const SectionTitleAndButton(
      {required this.title, required this.buttonTitle, Key? key})
      : super(key: key);

  final String title, buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.blueColor,
              fontSize:
                  (AppLocalizations.of(context)?.language ?? '') == 'English'
                      ? 25
                      : 20,
            ),
          ),
          Text(
            buttonTitle,
            style: TextStyle(
              color: AppColors.orangeColor,
              fontSize:
                  (AppLocalizations.of(context)?.language ?? '') == 'English'
                      ? 15
                      : 12,
            ),
          ),
        ],
      ),
    );
  }
}
