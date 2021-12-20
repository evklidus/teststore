import 'package:flutter/material.dart';
import 'package:teststore/common/app_colors.dart';

class PhoneInfoTitle extends StatelessWidget {
  const PhoneInfoTitle({required this.title, Key? key}) : super(key: key);
  
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppColors.blueColor,
                fontSize: 21,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
