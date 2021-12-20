import 'package:flutter/material.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PhoneInfoCategories extends StatelessWidget {
  const PhoneInfoCategories({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 28),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  AppLocalizations.of(context)?.shop ?? '',
                  style: TextStyle(
                    color: AppColors.blueColor,
                    fontSize: (AppLocalizations.of(context)?.language ?? '') == 'English' ?  20 : 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: AppColors.orangeColor,
                        height: 2.5,
                        width: MediaQuery.of(context).size.width / 5,
                      )),
                ),
              ],
            ),
            Text(
              AppLocalizations.of(context)?.details ?? '',
              style: TextStyle(
                color: Colors.grey,
                fontSize: (AppLocalizations.of(context)?.language ?? '') == 'English' ?  20 : 18,
                fontWeight: FontWeight.w400
              ),
            ),
            Text(
              AppLocalizations.of(context)?.features ?? '',
              style: TextStyle(
                color: Colors.grey,
                fontSize: (AppLocalizations.of(context)?.language ?? '') == 'English' ?  20 : 18,
                fontWeight: FontWeight.w400
              ),
            ),
          ],
        ),
      );
  }
}