import 'package:flutter/material.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PhoneInfoTitleForMemory extends StatelessWidget {
  const PhoneInfoTitleForMemory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppLocalizations.of(context)?.selectColorAndCapacity ?? '',
          style: const TextStyle(
            color: AppColors.blueColor,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
