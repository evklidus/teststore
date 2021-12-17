import 'package:flutter/material.dart';
import 'package:teststore/common/app_colors.dart';

class SectionTitleAndButton extends StatelessWidget {
  const SectionTitleAndButton({required this.title, required this.buttonTitle, Key? key }) : super(key: key);

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
}